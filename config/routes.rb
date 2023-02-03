Rails.application.routes.draw do

  get '/users/:user_id/posts', to: 'posts#index', as: 'post_path'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_show'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'comment_create'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'comment_new'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'like_create'
  get '/users/:user_id/posts/:id/likes/new', to: 'likes#new', as: 'like_new'

  get '/uncompleted', to: "comments#under_construction"

  resources :users, only: [:index, :show]

  resources :posts, only: [:new, :create]



  # resources :users, only: [:index, :show]do
  #   resources :posts, only: [:index, :show] do
  #     resources :comments, only: [:new, :create]
  #     resources :likes, only: [:new, :create]
  #   end
  # end
  # resources :posts, only: [:new, :create]
end
