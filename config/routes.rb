Rails.application.routes.draw do
  root 'static_pages#home'

  # orders
  post '/order',    to: 'orders#create'

  # sessions 
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # signup
  get '/signup',		to: 'users#new'
  post '/signup',   to: 'users#create'

  # portfolio
  get '/portfolio', to: 'users#portfolio'
		
  # static pages
  get '/help',			to: 'static_pages#help'
  get '/about',			to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes for /users/<id>
  resources :users
end
