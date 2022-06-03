Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:new,:create]
  resources :buys
    resources :badgets, only: [:new,:create,:show]
  
  resources :users, only: :show
end
