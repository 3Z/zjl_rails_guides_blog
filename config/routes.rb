Rails.application.routes.draw do

  devise_for :users

  namespace :admin, path: '/admin' do
    root 'home#index'

    resources :posts

    resources :photos

  end

  namespace :frontend, path: '/' do
    root 'home#index'

    resources :users, only: [:show] do
      resources :posts, only: [:show]
      resources :photos, only: [:show]
    end

  end

end
