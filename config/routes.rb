Rails.application.routes.draw do
  root 'meetups#index'

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/confirm_email/:token' => 'users#confirm_email', as: :confirm_email
  resources :comments, only: [:create]
  resources :meetups
  resources :users, only: [:new, :create]

  if Rails.env.development?
    get '/mail_previews(/:action(/:id(.:format)))' => 'mail_previews#:action'
  end

  namespace :api do
    get '/auth_token', to: 'users#auth_token', as: :auth_token
    resources :users
    resources :meetups
  end
end
