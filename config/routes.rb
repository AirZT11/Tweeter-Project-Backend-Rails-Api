Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :follows
      resources :likes
      resources :tweets
      resources :users
      post '/login', to: 'auth#login'
      get '/profile', to: 'users#profile'
      
      get '/tweets_users', to: 'tweets#user_follow_tweets'
      get '/user_tweets', to: 'tweets#user_specific_tweets'

      post '/users/:id/follow', to: "users#follow", as: "follow_user"
      post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
      get '/following', to: 'users#followed_users'
      get '/followers', to: 'users#followers'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
