Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  patch 'users/:id', to: 'users#update', as: 'update_user'
    resources :books, only: [:new, :index, :show, :destroy, :update, :edit, :create]
    resources :user, only: [:edit, :show, :update]
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
