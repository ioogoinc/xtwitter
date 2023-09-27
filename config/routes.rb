Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # CREATE Tweets
  resources :tweets, only: [:new, :create]
   # UPDATE Tweets
  resources :tweets, only: [:edit, :update]
 
end
