Rails.application.routes.draw do
  root "sessions#new"
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :show, :create]
  resources :bands
  resources :albums
  resources :tracks
  resources :notes
end
