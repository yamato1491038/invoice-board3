Rails.application.routes.draw do
  devise_for :users
  root 'regulars#index'
  resources :users, only: [:edit, :update]
  resources :regulars, only: [:new, :create, :show]
  
end
