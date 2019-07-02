This is if you are interested to know what is the flow of the routes and some notes on it as well! Enjoy!:

# GET requrest is anything that can be accessed through
# the url

delete action:

<%= link_to "Log Out", logout_path %>
- this has a method of GET
- jquery method called delete
  - this will already work if you have

- only shows information about the url or the
action that we are sending it to (has
  no info about the requrest verb )

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
path helpers
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! - are the prefix
and _path


****************
Resource routing:

- Resource Routing = allows you to quickly declare all of the common routes for a given resourceful controller.

- Instead of declaring separate routes for your index, show, new, edit, create, update and destroy actions, a resourceful route declares them in a single line of code.

Browsers request pages from Rails by making a request for a URL using a specific HTTP method, such as GET, POST, PATCH, PUT and DELETE.

Each method is a request to perform an operation on the resource. A resource route maps a number of related requests to actions in a single controller.
****************


root 'sessions#home'
get '/signup' => 'users#new'
post '/signup' => 'users#create'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

get '/auth/:provider/callback' => 'sessions#create'

-------------------------------------------------------------------------------
                  ⭐ get /users => 'users#index' ⭐
> 1. in the url the user types in an input into the browser then when the
user presses enter that request will be sent to the router

/in the browser/ request: GET /users (http://.../users)

/blog/ 1)the browser issues a request for the "/users" URL.
/comment/ #URL request(1) is sent to the router...

... This is sent to config/routes.rb

> 2. the request will then be routed to the
resources :users

/comment/ (#helper(resources) includes abstraction of...)

>2a. Then it will look for the http verb and action that matches the request from the browser.
/blog/ Rails routes “/users” to the index action in the Users controller.
/comment/# Request matches route and is sent to controller.

(sent here)
app/controllers/users_controller.rb
def index
  @users = User.all
end

>3. The index action is hit then processed which asks the DATABASE
/comment/ # The 'index' action is run, which makes a request for all of the user instances form
            # from the model
/blog/The index action asks the User model to retrieve all users (User.all)

>4. The model then gives calls the database and ask it for all of the users
/comment/ Gets all of the users form the database and returns to controller
/blog/ The User model pull all the users form the database.


>5
  /blog/ The user model returns the list of users to the controller
  /comment/ and returns to controller

(return here)
app/controllers/users_controller.rb

>6 All of the user instances from the database is set to an instance of @users
  /blog/ The controller captures the users in the @users variable, which is passes to the
  index view
  /comment/ Assigns all of the users to an instance variable, and sends them to view

(go here -> index.html.erb)
>7 use the newly created users on the view
  /blog/ The view uses embedded Ruby to render the “/users” page as HTML.
  /comment/ View uses @users to display a list of all of the users' names and emails at

>8 the view will then be displayed here: http://.../users
  /blog/ The controller passes the HTML back to the browser
  /comment/ http://.../users



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

----------



We briefly discussed this resources method in the dynamic routing lesson. This will create routing methods for posts that we can utilize in our views and controllers. Running rake routes in the terminal will give the following output:

posts   GET  /posts(.:format)       posts#index
post    GET  /posts/:id(.:format)   posts#show

These four columns tell us everything that we'll need in order to use the route helper methods. The breakdown is below:

    Column 1 - This column gives the prefix for the ###-route helper methods-### . In the current application, posts and post are the prefixes for the methods that you can use throughout your applications. The two most popular method types are _path and _url. So if we want to render a relative link path to our posts' index page, the method would be posts_path or posts_url.
    > The difference between _path and _url is that
    * _path gives the relative path and
    * _url renders the full URL.
    If you open up the rails console in the sample app you can test these route helpers out. Run app.posts_path and see what the output is. You can also run app.posts_url and see how it prints out the full path instead of the relative path. In general, it's best to use the _path version so that nothing breaks if your server domain changes.

    Column 2 - This is the HTTP verb.

    Column 3 - This column shows what the path for the route will be and what parameters need to be passed to the route. As you may notice, the second row for the show route calls for an ID. When you pass the resources method to the :show argument, it will automatically create this route and assume that you will need to pass the id into the URL string. Whenever you have id parameters listed in the path like this, you will need to pass the route helper method an ID, so an example of what our show route code would look like is post_path(@post). Notice how this is different than the index route of posts_path. Also, you can ignore the (.:format) text for now. If you open up the Rails console again, you can call the route helpers. If you have a Post with an id of 3, you can run app.post_path(3) and see what the resulting output is. Running route helpers in the rails console is a great way of testing out routes to see what their exact output will be.

    Column 4 - This column shows the controller and action with a syntax of controller#action.
