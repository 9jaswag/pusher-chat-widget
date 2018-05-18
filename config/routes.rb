Rails.application.routes.draw do
  resources :chatrooms
  resources :chats
  get '/dashboard', to: 'chats#index'
  root 'chatrooms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
