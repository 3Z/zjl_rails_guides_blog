Rails.application.routes.draw do

  devise_for :users

  # resources :users do
  #   resources :articles
  #   resources :photos
  # end
  #
  # resources :articles do
  #   resources :comments
  # end

  # devise_for :users, path: 'user', controllers: {registrations: 'users/registrations'}

  namespace :admin, path: '/admin' do
    root 'home#index'

    get '/profile', to: 'home#profile'

    # resources :messages, only: [:show, :destroy, :index] do
    #   member do
    #     post 'mark_as_read', to: 'messages#mark_as_read'
    #   end
    # end

    resources :articles

    resources :photos

  end

  namespace :frontend, path: '/' do
    root 'home#index'

  end

end
