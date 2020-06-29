Rails.application.routes.draw do
  get 'users/index'
  get 'user/:id', to: 'users#show', as: :user
  delete 'user/:id', to: 'users#destroy'

  root 'posts#index'
  get 'posts/manage', to: 'posts#manage'

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
