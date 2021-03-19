Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Sources
  resources :sources, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    resources :comments, only: [:create], as: "create_comment"
  end
  get "feed", to: "sources#feed", as: "feed"

  # Quotes
  resources :quotes, only: [:new, :create, :show] do
    resources :comments, only: [:create], as: "create_comment_from_feed"
  end

  # Pages
  get "search", to: "pages#search"
  get "user/:id/overview", to: "pages#user_profile_overview", as: "user_profile_overview"
  get "user/:id/followers", to: "pages#user_profile_followers", as: "user_profile_followers"
  get "user/:id/following", to: "pages#user_profile_following", as: "user_profile_following"

  # Folders
  resources :folders, only: [:show, :edit, :new, :create]

  # Relationships
  resources :relationships, only: [:update, :destroy]
  post "relationships/:id", to: "relationships#create", as: "create_relationship"
  delete "relationship/:id", to: "relationships#destroy", as: "delete_relationship"

  # Contact
  resources :contacts, only: [:create]

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :quotes, only: [ :create ]
    end
  end
end
