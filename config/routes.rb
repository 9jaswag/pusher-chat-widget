Rails.application.routes.draw do
  get 'chatrooms/new'

  get 'chatrooms/create'

  resources :chatrooms do
    resources :chats
  end
  root 'chats#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
