Rails.application.routes.draw do
  namespace :api  do
    resources :tweets, only: [:show, :create, :detele, :update]
    resources :users, only: [:show] do
      member do
        resources :tweets, only: [:index]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
