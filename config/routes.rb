Rails.application.routes.draw do
  devise_for :users
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

  root 'home#top'
end
