Rails.application.routes.draw do
  root to: "pages#home"


  devise_for :users
  resources :users, only: [:index, :show] do
    resources :abouts, only: [:create, :new, :edit, :update]
  end

  resources :posts do
    resources :comments
    resource :likes, only: [:create, :destroy]
  end

  resources :chatrooms, only: [:show, :index, :create] do
    resources :messages, only: [:create]
  end

  resources :chat_room_users, only: [:create]

  resources :locations, only: [:create, :update]
end
