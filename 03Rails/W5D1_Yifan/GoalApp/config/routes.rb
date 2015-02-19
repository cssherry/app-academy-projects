Rails.application.routes.draw do
  resources :users

  resource :session

  resources :goals do
    get :completed, on: :member
    resources :cheers, only: :create
  end

  resources :comments

end
