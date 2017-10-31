Rails.application.routes.draw do
  resources :train_bookings
  root 'train_bookings#index'
end
