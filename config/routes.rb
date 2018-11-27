Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :chats, only: [:index, :show]
  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  post "/save-coordinates", to: "users#save_coordinates"

  resources :events, only: [:index, :show, :new, :create, :edit, :update]

  namespace :my do
    resources :events, only: [:index]
  end
  resources :attendees, only: [:create]

end
