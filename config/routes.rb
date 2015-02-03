Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :articles
    resources :photos
  end

  resources :articles do
    resources :comments
  end

  # devise_for :users, path: 'user', controllers: {registrations: 'users/registrations'}

  namespace :admin, path: '/admin' do
    root 'home#index'

    get '/profile', to: 'home#profile'

  end

  namespace :frontend, path: '/' do
    root 'home#index'

  end

end
