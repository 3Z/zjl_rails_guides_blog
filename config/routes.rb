Rails.application.routes.draw do

  # resources :users do
  # end

  resources :articles do
    resources :comments
  end

  # root 'home#index'

  devise_for :users

  namespace :frontend, path: '/' do
    root 'home#index'

  end

end
