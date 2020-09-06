Rails.application.routes.draw do
  devise_for :users
  root 'regulars#index'
  resources :users, only: [:edit, :update]
  
  resources :regulars, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :persuations, only: [:new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end
end
