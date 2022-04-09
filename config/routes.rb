Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments, only: [:create, :new]
    resources :likes, only: [:create]
  end
end
