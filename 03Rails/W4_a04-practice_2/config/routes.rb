Links::Application.routes.draw do
  resources :users
  resource :session
  resources :links do
    resources :comments, only: :create
  end
  resources :comments, only: [:destroy]
end
