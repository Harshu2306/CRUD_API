Rails.application.routes.draw do
  resources :users
  resources :blogs
  post '/auth/login', to: 'authentication#login'
end
