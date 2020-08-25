Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sources, only: [:index, :new, :create]

  resources :quotes, only: [:new, :create]

  resources :folders, only: [:show]
end
