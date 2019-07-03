Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'sessions#home'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
get '/auth/:provider/callback' => 'sessions#create'
resources :users
resources :ais#, only:[:new ,:create, :show, :index, :update, :edit]
resources :services
resources :transactions
resources :ais, only: [:show] do
  resources :services, only: [:index, :show, :new, :create]
end
# - Resource Routing = allows you to quickly
## declare all of the common routes for a given resourceful controller.
end
