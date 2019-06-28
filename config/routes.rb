Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'sessions#home'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

get '/auth/:provider/callback' => 'sessions#create'

# get '/users', to: 'users#index'
# get '/users/new', to: 'users#new'
# post '/users', to: 'users#create'
# get '/users/:id', to: 'users#show'
# get '/users/:id/edit', to: 'users#edit'
# patch/put '/users/:id', to: 'users#update'
# delete '/users/:id', to: 'users#destroy'
resources :users

# get '/ais', to: 'ais#index'
# get '/ais/new', to: 'ais#new'
# post '/ais', to: 'ais#create'
# get '/ais/:id', to: 'ais#show'
# get '/ais/:id/edit', to: 'ais#edit'
# patch/put '/ais/:id', to: 'ais#update'
# delete '/ais/:id', to: 'ais#destroy'
resources :ais#, only:[:new ,:create, :show, :index, :update, :edit]

# get '/services', to: 'services#index'
# get '/services/new', to: 'services#new'
# post '/services', to: 'services#create'
# get '/services/:id', to: 'services#show'
# get '/services/:id/edit', to: 'services#edit'
# patch/put '/services/:id', to: 'services#update'
# delete '/services/:id', to: 'services#destroy'
resources :services

# get '/transactions', to: 'transactions#index'
# get '/transactions/new', to: 'transactions#new'
# post '/transactions', to: 'transactions#create'
# get '/transactions/:id', to: 'transactions#show'
# get '/transactions/:id/edit', to: 'transactions#edit'
# patch/put '/transactions/:id', to: 'transactions#update'
# delete '/transactions/:id', to: 'transactions#destroy'
resources :transactions

resources :ais, only: [:show] do
  resources :services, only: [:index, :show, :new, :create]
end

end
