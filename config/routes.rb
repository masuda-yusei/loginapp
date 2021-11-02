Rails.application.routes.draw do
  resources :sessions
  resources :blogs
  resources :users
  resources :favorites
end
