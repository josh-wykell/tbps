Rails.application.routes.draw do
  resources :carts do
    resources :cart_membership_statuses
    resources :sale_items
  end
  resources :speaking_events
  resources :other_events
  resources :films
  resources :speakers
  resources :members do
    resources :memberships
  end
  resources :mailing_lists
  get 'current_cart',   to: 'carts#show'
  get 'checkout',       to: 'carts#checkout'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
end
