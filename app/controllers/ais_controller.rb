class AisController < ApplicationController

def new
  # create a new instance of Ai
  @ai = Ai.new
  # built a new transaction on the ai which will associate the transaction to the ai
  @transaction = @ai.transactions.build
  # the service is associated with the transaction
  @transaction.build_service

#   @ai = Ai.new(user_id: @user.id)
# @user.ais << @ai

end

# saves a new ai
def create
  @ai = current_user.ais.build(ai_params)
  if current_user.data > 220 # check if the current user date is greater then 220

    if params[:ai][:transactions_attributes]["0"][:service_id] != "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:name] != "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:description] != "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:price] != ""
      flash[:notice] = "Invalid action - please only pick from the list or create a new service"
      redirect_to new_ai_path
    else
      if params[:ai][:transactions_attributes]["0"][:service_id] != "" # if selected in the dropdown
           @ai.save
           @transaction = @ai.transactions.last
           @transaction.service_id = params[:ai][:transactions_attributes]["0"][:service_id]
           @transaction.save
          redirect_to edit_transaction_path(@transaction)
      else
        # if typed in manually
        if @ai.save!
          redirect_to new_transaction_path
        else
          render :new
        end
      end
    end



  else
    redirect_to user_path(current_user)
  end
end


  # view all of the ais
def index
  if params[:order]
    @ais = Ai.order_by_ais
  else
  @ais = Ai.search(params[:search])
  end
end

  # show one ai
def show
  @ai = Ai.find_by(id: params[:id])
  #@services = @ai.services

  respond_to do |f|
    f.html
    f.json {render json: @ai}
  end
end

  # get the form to make changes to the
  # selected resource
def edit
  set_ai
end

# saves the changes that where made in the edit form
def update
  set_ai
  if @ai.update(ai_params)
    redirect_to ai_path(@ai)
  else
    render :edit
  end
end

def destroy
  # when you want to log someone out you
# want to get rid of them in the session
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
# params[:ai][:transactions_attributes]["0"][:service_id] == "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:name] == "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:description] = "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:price] == ""
