Rails.application.routes.draw do

  resources :articles do
    resources :comments
  end

  devise_for :users

  resources :users , only: [:index, :show]

  # devise_for :users, path: 'user', controllers: {registrations: 'users/registrations'}

  namespace :admin, path: '/admin' do
    root 'home#index'

    get '/profile', to: 'home#profile'

  end

  namespace :frontend, path: '/' do
    root 'home#index'

  end

end
