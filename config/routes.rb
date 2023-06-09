Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  # Customer Dashboard
  resources :customers, only: [:index, :create, :edit, :update, :destroy] do
    get 'dashboard', on: :collection
    get 'upload', on: :collection
    post 'upload_file', on: :collection
  end

  # Employee Dashboard
  resources :employees, only: [:index] do
    get 'dashboard', on: :collection
    get 'completed', on: :collection
    get 'accept', on: :collection
    post 'accept_task', on: :collection
  end

  # Admin Dashboard
  namespace :admin do
    get 'dashboard', to: 'admin#dashboard'
    get 'users', to: 'admin#users'
    get 'tasks', to: 'admin#tasks'
    get 'manage', to: 'admin#manage'
    post 'manage', to: 'admin#manage'
  end
end
