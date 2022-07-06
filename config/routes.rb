Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :blogs
  resources :news
  resources :likes
  post '/auth/login', to: 'authentication#login'
end
