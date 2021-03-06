class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :chats
  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}


# ユーザーをフォローする
def follow(other_user)
  following << other_user
end

# ユーザーをフォロー解除する
def unfollow(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
end

# 現在のユーザーがフォローしてたらtrueを返す
def following?(other_user)
  following.include?(other_user)
end


# 住所カラムを一つに
def full_address
   prefecture_name + address_city + address_street + address_building
end

include JpPrefecture
 jp_prefecture :prefecture_code

 def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
 end


 def prefecture_name=(prefecture_name)
   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
 end

end
