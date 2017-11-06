Rails.application.routes.draw do
  resources :reservations, except: [:show]
  root 'reservations#index'
end
