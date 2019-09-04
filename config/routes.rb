Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :categories, only: [:new, :create]

  resources :disasters do
    resources :comments, only: [:create, :destroy]
  end

end
