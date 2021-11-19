Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :outfits do
    resources :bookings, only: %i[index show new edit update create]
    patch 'bookings/:id/approve', to: 'bookings#approve', as: 'booking_approve'
  end

  resources :bookings, only: %i[destroy]
end
