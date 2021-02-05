Rails.application.routes.draw do
  root to: 'pages#index', as: 'welcome'

  # Sessions
  resources :sessions, only: %i[new create destroy]
  # Users
  resources :users
  # Pages
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
