Rails.application.routes.draw do
  namespace :admin do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    resources :users
    resources :reservations

    root to: "users#index"
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :reservations, except: [:show]
  root 'reservations#index'
end
