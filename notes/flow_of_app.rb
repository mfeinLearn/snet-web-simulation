# Steps for a visit to an Ais index page:

#1. request: GET /ais (http://localhost:3000/ais)  #URL request (1)
👇                                        #is sent to router...
#2. config/routes.rb
#3. resources :ais                     (#helper includes abstraction of..)
#4. get /ais => 'ais#index'               #Request matches route and
👇                                        #is sent to the controller
#5. app/controller/ais_controller.rb
#6. def index
#     @ais = Ai.all                       # The index acton is run which makes a request for all of the ai instances from the model (3)
#   end
👇
#7. app/models/ai.rb
# class Ai < ActiveRecord::Base # Gets all of the ais from the database(4)
# end                           # and returns to controller
👇
#8. app/controllers/ais_controller.rb
# def index                     # Assign all of the ais to
# @ais = Ai.all                 # an instance variable, and
# end                           # sends them to the view (6)...
👇
# index.html.erb                # View uses @ais (7)
                                # to display a list
                                # of all of the ais'
                                # names and emails at

                                # "http://localhost:3000/ais" (8)
# <ul><% @ais.each do |ai| %>
  # <li><%=link_to ai.name_and_balance, ai_path(ai) %> - <%= link_to 'Destroy',  ai_path(ai), data: { confirm: 'Are you sure?' }, method: :delete %> OR <%= link_to "Edit AI", edit_ai_path(ai) %></li>
  # <% end %>
# </ul>



class AisController < ApplicationController

def new
  @ai = Ai.new
  @transaction = @ai.transactions.build
  @transaction.build_service

#   @ai = Ai.new(user_id: @user.id)
# @user.ais << @ai

end

def create
  @ai = current_user.ais.build(ai_params)
  if current_user.data > 220
    if params[:ai][:transactions_attributes]["0"][:service_id] != ""
         @ai.save
         @transaction = @ai.transactions.last
         @transaction.service_id = params[:ai][:transactions_attributes]["0"][:service_id]
         @transaction.save
        redirect_to edit_transaction_path(@transaction)
    else
      if @ai.save!
        redirect_to new_transaction_path
      else
        render :new
      end
    end
  else
    redirect_to user_path(current_user)
  end
end


def index
  @ais = Ai.order_by_price
  #@ais = Ai.order_by_ais
end


def show
  set_ai
  @services = @ai.services
end


def edit
  set_ai
end

def update
  set_ai
  if @ai.update(ai_params)
    redirect_to ai_path(@ai)
  else
    render :edit
  end
end

def destroy
  set_ai
  @ai.destroy
  redirect_to ais_path
end

private

def set_ai
  @ai = Ai.find_by(id: params[:id])
  if !@ai
    redirect_to ais_path
  end
end

def ai_params
  params.require(:ai).permit(:name,:user_id, :description, :balance,
    transactions_attributes:
    [:service_id,
      service_attributes:
      [:name, :description, :price]
      ])

end

end

############################################################################################
#  Step for a visit to an individual ai’s page:

# request: GET ais/1 (http://localhost:3000/ais/1) # URL request
# params => {..."id" => "1"}                       # and params ("params[:id]")
👇                                                 # are sent to the router...
# config/routes.rb
# resources :ais                                   # (#helper includes abstraction of...)
# get /ais/:id => 'ais#show'                       # Request matches route
👇                                                 # in ais controller...
# app/controllers/ais_controller.rb
# before_action :set_ai                           # Calls "set_ai" in actions;
# ...
# def show                                        # the 'show' action is run, which
# end                                             # calls "set_ai", which
# ...
# set_ai                                          # makes a request for the ai
#   @ai = Ai.find(params[:id])                    # with ":id" of "1", which
# end
👇                                                # is sent to the ai model...
# app/models/ai.rb
# class Ai < ActiveRecord::Base                   # Gets the ai with id of "1"
# end                                             # from the database and
👇                                                # returns it to the controller...
# app/controllers/ais_controller.rb
# before_action :set_ai
# ...
# def show
# end
# ...
# set_ai                                         # Assign the ai with id of ":id"
#   @ai = Ai.find(params[:id])                   # to "@ai", and sends it
# end
👇                                               # to view's show page
# show.html.erb
# ...
# <p>                   # view uses @ai
#   <%= @ai.name %>     # to display ai's name
# </p>                  # or any other attributes at
# ...
👇                      # "http://localhost:3000/ais/1"

######################################################################################
# A form for creating a new ai with name and age properties would follow this path:

# request: POST ais/ (http://localhost:3000/ais)        #URL request along with
# ai_params => {"name"=> "Matt", "age" => "35"}         #ai_params ("params[:ai]")
👇                                                        #are sent to the router...
# config/routes.rb
# resources :ais                                        (#helper includes abstraction of...)
# post /ais => 'ais#create'                           #Request matches route
👇                                                        # in ais controller...
# app/controllers/ais_controller.rb
# def create                                             # The 'create' action is run, which
#   @ai = Ai.new(ai_params)                        # creates a new ai with params
#   ...                                                  # then the new ai instance
# end
👇                                                       # is sent to the ai model...
# app/models/ai.rb
# class Ai < ActiveRecord::Base                        #posts the new ai's data
# end                                                    #to the database, then
👇                                                       # returns to controller...
# app/controllers/ais_controller.rb
# def create
#   ...
#   respond_to do |format|
#     if @ai.save                                    # if new ai successfully saved,
#       format.html (redirect_to @ai ...)             # redirect to the new ai's
#       ...                                            # show page (@ai contains
# end                                                  # the ai's id, so goes to
👇                                                     # GETS "ais/:id")...
# config/routes.rb
# resources :ais                                    (#helper includes abstraction of...)
#get /ais/:id => 'ais#show'                       #Request matches route
👇                                                    #in ais controller...
# app/controllers/concerns/ais_controller.rb
# def show                                           # The 'show' action is run, which
# end                                                # passes @ai
👇                                                   # to the ai's new show page...
# app/views/ais/show.html.erb
# ...
# <p>
#   <strong>Name:</strong>
#   <%= @ai.name %>                               #View uses @ai to show
#   ...                                             #the ai's name and age
#   <%= @ai.age %>
# </p>
# ...
👇                                                  # http://localhost:3000/ais/:id
