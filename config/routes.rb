Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # CREATE Tweets
  resources :tweets, only: [:new, :create]
   # UPDATE Tweets
  resources :tweets, only: [:edit, :update]

  resources :tweets do
    member do
      post 'like', to: 'tweets#like'
      delete 'unlike', to: 'tweets#unlike'
      post 'retweet', to: 'tweets#retweet'
      post 'quote', to: 'tweets#quote'
      get 'reply', to: 'tweets#reply'
      post 'bookmark', to: 'tweets#bookmark'
      get 'stats', to: 'tweets#stats'
    end
  end

  # resources :users do
  #   member do 
  #     get 'tweets', to: 'user#show'
  #   end
  # end


end


