Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, constraints: { format: :json } do
    post 'v1/auth/signin', to: 'session#login'
    namespace :v1 do
      post 'users/signup', to: 'users#create'
      get 'projects/my_projects', to: 'projects#my_projects'
      resources :projects
      resources :projects do
        resources :contents, only: [:index, :create, :show]
      end

      resources :contents, only: [:update, :destroy]

    end
  end
end
