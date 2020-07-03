Rails.application.routes.draw do
  root 'admin/users#index'
  get 'dashboard', to: 'posts#dashboard'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts do
    get '/top/posts',  controller: 'posts', action: 'top', on: :collection
    collection do
      get :status
    end
    resources :comments
    resources :likes
  end

  resources :categories do
    resources :posts
  end

  namespace :admin do
    resources :users, :posts, :categories
  end
end
