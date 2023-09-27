Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # CREATE Tweets
  resources :tweets, only: [:new, :create]
   # UPDATE Tweets
  resources :tweets, only: [:edit, :update]

  #LIKE A TWEET
  resources :tweets do
    member do
      post 'like'
    end
  end

  # UNLIKE A TWEET
  resources :tweets do
    member do
      delete 'unlike'
    end
  end

  # RETWEET A TWEET
  resources :tweets do
    member do
      post 'retweet'
    end
  end

  # QUOTE A TWEET
  resources :tweets do
    member do
      post 'quote'
    end
  end

  # REPLY A TWEET

  resources :tweets do
    member do
      get 'reply'
    end
  end

  # BOOKMARK A TWEET

  resources :tweets do
    member do
      post 'bookmark'
    end
  end

  

end


