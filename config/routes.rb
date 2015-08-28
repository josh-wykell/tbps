Rails.application.routes.draw do
  resources :carts
  resources :sale_items
  resources :speaking_events
  resources :other_events
  resources :films
  resources :speakers
  get 'current_cart', to: 'carts#show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
end
