Rails.application.routes.draw do
  devise_for :users
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'home#top'
end
