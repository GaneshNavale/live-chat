Rails.application.routes.draw do
  devise_for :users
  root 'welcomes#index'

  get 'users/:id', to: "users#show", as: "profile"

  resources :chatrooms, param: :slug
  resources :personal_chatrooms
  
  resources :messages
  resources :personal_messages

  resources :welcomes, only: [:index] do
  	get :search_users, on: :collection
    get :friends, on: :collection
	end
	resources :friend_requests do
    get :accept, on: :member    
  end
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
