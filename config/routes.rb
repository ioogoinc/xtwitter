Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :api do 
      resources :tweets do
        member do
          get 'new', to: 'tweets#new'
          post 'create', to: 'tweets#create'
          get 'edit', to: 'tweets#edit'
          patch 'update', to: 'tweets#edit'
          post 'like', to: 'tweets#like'
          delete 'unlike', to: 'tweets#unlike'
          post 'retweet', to: 'tweets#retweet'
          post 'quote', to: 'tweets#quote'
          get 'reply', to: 'tweets#reply'
          post 'bookmark', to: 'tweets#bookmark'
          get 'stats', to: 'tweets#stats'
        end
      end
  end
  
 

end


