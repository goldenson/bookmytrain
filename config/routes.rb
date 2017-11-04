Rails.application.routes.draw do
  resources :train_bookings, except: [:show]
  root 'train_bookings#index'
end
