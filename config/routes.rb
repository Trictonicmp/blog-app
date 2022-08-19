Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create, :destroy]
    end
  end
  
  resources :posts, only: [:new, :create]
  # get'/users/:id', to: 'users#show'
  # get'/users/:id/posts', to: 'posts#index'
  # get'users/:id/posts/:post_id', to: 'posts#show'
end
