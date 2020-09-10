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

  resources :traffics, only: [:new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :costs, only: [:new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :contracts, only: [:index, :new, :create, :show, :update, :destroy] do
    collection do
      get 'search'
    end
  end

  resources :breakdowns, only: [:index, :show] do
    collection do
      get 'search'
      get 'check'
    end
  end
end
