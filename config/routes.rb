Rails.application.routes.draw do
  # get 'pages/showtop'
  # post 'pages/create_posts'
  root 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # resources :users
  resources :posts do
    resources :likes
  end

  resources :posts do
    get '/top/posts',  controller: 'posts', action: 'top', on: :collection
    resources :comments

  end

  resources :categories do
    resources :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
