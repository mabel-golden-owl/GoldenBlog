Rails.application.routes.draw do
  get 'users/index'
  get 'user/:id', to: 'users#show', as: :user
  delete 'user/:id', to: 'users#destroy'

  root 'posts#index'
  get 'posts/manage', to: 'posts#manage'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts do
    collection do
      get :top
    end

    resources :likes
    resources :comments
  end

  resources :categories do
    resources :posts
  end
end
