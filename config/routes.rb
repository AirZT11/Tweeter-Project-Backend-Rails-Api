Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tweets
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/tweet', to: 'tweets#tweet'
      # get "/auto_login", to: "auth#auto_login"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
