Rails.application.routes.draw do
  get 'users/index'
  get 'user/:id', to: 'users#show', as: :user
  delete 'user/:id', to: 'users#destroy'

  root 'posts#index'
  get 'posts/manage', to: 'posts#manage'

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
end
