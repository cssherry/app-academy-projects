Links::Application.routes.draw do
  resources :users, only: [:create, :new, :index]
  resource :session, only: [:create, :new, :destroy]
  resources :links do
    resources :comments, only: :create
  end
  resources :comments, only: :destroy
end
