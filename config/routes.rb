Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :posts do
    resources :comments
    resource :likes, only: [:create, :destroy]
  end

  resources :locations, only: [:create, :update]
end
