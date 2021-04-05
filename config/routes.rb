Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Sources
  resources :sources, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    resources :comments, only: [:create], as: "create_comment"
  end
  get "feed", to: "sources#feed", as: "feed"

  # Quotes
  resources :quotes, only: [:new, :create, :show, :destroy] do
    resources :comments, only: [:create], as: "create_comment_from_feed"
  end

  resources :comments, only: [:new, :create, :show, :index, :destroy]
  resources :comment_votes, only: [:new, :create, :destroy]


  # Pages
  get "search", to: "pages#search"
  get "user/:id/overview", to: "pages#user_profile_overview", as: "user_profile_overview"
  get "user/:id/followers", to: "pages#user_profile_followers", as: "user_profile_followers"
  get "user/:id/following", to: "pages#user_profile_following", as: "user_profile_following"
  get "coming-soon", to: "pages#coming_soon", as: "coming_soon"

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
      resources :sources, only: [:create, :update]
      resources :quotes, only: [:create, :destroy]
      resources :comments, only: [:create]
      resources :tags, only: [:index, :create]

    end
  end

  get '/user' => "sources#feed", :as => :user_root
end
