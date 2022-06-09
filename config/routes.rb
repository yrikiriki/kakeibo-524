Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:new,:create]
  resources :records, only: [:new,:create,:show] do
  resources :buys
  end
    resources :badgets, only: [:new,:create,:show]
  
  resources :users, only: :show
end
