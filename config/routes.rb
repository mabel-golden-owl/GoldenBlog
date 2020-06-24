Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # resources :users
  resources :posts do
    resources :likes
  end

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
