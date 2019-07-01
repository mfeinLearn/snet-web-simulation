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
# params[:ai][:transactions_attributes]["0"][:service_id] == "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:name] == "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:description] = "" && params[:ai][:transactions_attributes]["0"][:service_attributes][:price] == ""
