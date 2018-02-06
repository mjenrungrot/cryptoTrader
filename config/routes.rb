Rails.application.routes.draw do
  get '/signup',		to: 'users#new'
		
  get '/help',			to: 'static_pages#help'
  get '/about',			to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  # routes for /users/<id>
  resources :users
end
