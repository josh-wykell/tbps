Rails.application.routes.draw do
  resources :payment_notifications
  resources :carts
  resources :sale_items
  resources :speaking_events
  resources :other_events
  resources :films
  resources :speakers
  resources :memberships
  resources :members
  get 'current_cart', to: 'carts#show'
  get 'checkout',     to: 'carts#checkout'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
end
