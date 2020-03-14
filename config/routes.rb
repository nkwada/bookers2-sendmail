Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
}
  get 'home/about'
  get 'search', to: 'searches#search'
 resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :rooms

  root 'home#top'
end
