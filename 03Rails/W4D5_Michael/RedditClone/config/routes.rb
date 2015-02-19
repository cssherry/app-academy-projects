Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index, :destroy] do
    resources :comments, only: :new
  end

  resources :comments, only: :create
end
