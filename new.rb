ick_button('Create User')

     Capybara::ElementNotFound:
       Unable to find button "Create User"
     # /Users/malcomefein/.rvm/gems/ruby-2.


     Simple example:

<%= @user.add_data  %>

    get '/users/:id' do

      #gets params from url

      @user = User.find(params[:id]) #define instance variable for view

      erb :'users/show' #show single user view

    end

    Copied!
#-------------------
#    new.html.erb
#-------------------
<h1>Sign up here!</h1>

<%= form_for(@user) do |f|%>

<%= f.label :name %>
<%= f.text_field :name %>

<%= f.label :password %>
<%= f.password_field :password %>

<%= f.submit "Create User" %>


<% end  %>
#-------------------
