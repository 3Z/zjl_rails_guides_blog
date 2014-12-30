Rails.application.routes.draw do

  resources :articles do
    resources :comments
  end

  devise_for :users

  namespace :admin, path: '/admin' do
    root 'home#index'

    get '/profile', to: 'home#profile'

  end

  namespace :frontend, path: '/' do
    root 'home#index'

  end

end
