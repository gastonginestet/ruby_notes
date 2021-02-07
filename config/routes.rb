Rails.application.routes.draw do
  root to: 'pages#index', as: 'welcome'

  # Sessions
  resources :sessions, only: %i[new create destroy]
  # Users , books and notes
  resources :users do
    resources :books do
      resources :notes do
        member do
          get :export
        end
      end
    end
  end
  # Pages
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
