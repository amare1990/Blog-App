Rails.application.routes.draw do


  root 'users#index'

  get 'users/user/:id', to: 'users#user'

  resources :users do
    resources :posts
  end
end
