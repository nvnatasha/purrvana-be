Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do
        resources :user_cats, only: [:index, :show]
        get 'most_used_cat', to: 'user_cats#most_used'
      end

      post '/login', to: 'auth#create'
      resources :sessions, only: [:index, :show, :create]
      resources :cats, only: [:index, :show]
      resources :daily_wisdom, only: [:index, :show]
    end
  end
end

