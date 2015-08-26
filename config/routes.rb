Rails.application.routes.draw do
  resources :sales
  resources :carts
  resources :other_events
  resources :films
  resources :carts
  resources :speakers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
end
