root 'sessions#home'
- Their is a few things going on here:
root is equivalent to the following '/'
The way that I used this is by using the Active Record root method. Next their is a convention to display controller actions in your routes.rb which is 'controller#action'
In this case the controller is sessions and the action is home.

Note: Just to make sure we are all in the same page as mentioned in a provious blog post a controller is what communticates between the Model and the view. AKA the weater if you are thinking of the MVC relationship as a resteraunt.
The Model is the kitchen(where they make the food), the controller is the weater(where they communticat between the weater and the table) the table which is the view(what the user sees)

The following routes are the routes that contribute to login/signup/logout:

get '/signup' => 'users#new'
This is doing a GET request which is when you are retrieving information in our case not we are doing this via a form which is going to change the url to
'/signup' which will render a new.html.erb form.


post '/signup' => 'users#create'
This POST request will be triggered when the user clicks on the submit button on the form.  get the data form the form getting the data form the form and sending that data to the users controller and its new action to load up the new.htmt.erb view

# get '/login' => 'sessions#new'
# post 'login' => 'sessions#create'
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
