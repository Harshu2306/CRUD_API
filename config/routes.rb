Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :blogs
  post '/blogs/:id/add_like', to: 'blogs#add_like'
  resources :news
  post '/news/:id/add_like', to: 'news#add_like'
  resources :sneakers
  post '/auth/login', to: 'authentication#login'
  post '/comments/blogs', to: 'comments#comment_with_blog'
  post '/comments/solution', to: 'comments#solution'
  post 'blog/comments' , to: 'comments#blog_with_comments'
  post '/nested_attributes' , to: 'comments#nested_attribute'
  post '/ss1' , to: 'blogs#ss1'
  get 'generate_csv', to: 'csvs#generate_csv'
end
