Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :update, :destroy]
  resources :orders, only: [:new, :create, :index]
  root 'products#index'
end