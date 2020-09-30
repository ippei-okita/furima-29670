Rails.application.routes.draw do
  resources :items
  devise_for :users
  root to: "items#index"
  resources :orders, only: [:index, :create]
end
