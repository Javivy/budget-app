Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  unauthenticated do
    root 'static#splash', as: :unauthenticated_root
  end

  resources :entities
  resources :groups
end
