Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :reservations

    root to: "users#index"
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :reservations, except: [:show]
  root 'reservations#index'
end
