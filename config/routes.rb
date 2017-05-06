Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :home
  resources :services
  resources :accounts
  resources :users

  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
end
