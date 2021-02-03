Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'pages#index'
  resources :sessions
  get 'register' => 'users#new', :as => 'register'
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout

  # Users
  resources :users

  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
