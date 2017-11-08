Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :reservations, except: [:show]
  root 'reservations#index'
end
