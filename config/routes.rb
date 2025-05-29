Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :user_cats, only: [:index, :show]

        get 'most_used_cat', to: 'user_cats#most_used'
      end

      post '/login', to: 'auth#create'
      resources :sessions, only: [:index, :show, :create] # meditation sessions
    end
  

      resources :cats
      resources :sessions, only: [:index, :show, :create]
      resources :daily_wisdom, only: [:index, :show]
    end
  end

end
