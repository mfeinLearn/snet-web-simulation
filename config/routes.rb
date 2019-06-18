Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'sessions#home'
get '/signup' => 'users#new'
# get '/login' => 'sessions#new'
# post 'login' => 'sessions#create'
get '/signin' => 'sessions#new'
post '/signin' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
resources :users
resources :ais#, only:[:new ,:create, :show, :index, :update, :edit]
resources :services
resources :transactions
resources :ais, only: [:show] do
  resources :services, only: [:index, :show, :new, :create]
end

end
