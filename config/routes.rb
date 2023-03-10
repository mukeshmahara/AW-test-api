Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, constraints: { format: :json } do
    
    scope :v1 do
      post 'auth/signin', to: 'session#login'
    end

    namespace :v1 do
      post 'users/signup', to: 'users#create'
      resources :projects do
        get 'my_projects', to: 'projects#my_projects', on: :collection     
        resources :contents, only: [:index, :create, :show]
      end

      resources :contents, only: [:update, :destroy]

    end
  end
end
