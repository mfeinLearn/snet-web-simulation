class AisController < ApplicationController

def new
  @ai = Ai.new
  @transaction = @ai.transactions.build
  @transaction.build_service

end

def create
  #byebug
  @ai = Ai.create(ai_params)
  @user = current_user
  #byebug
  @ai.user_id = @user.id
  if @ai.save
    #redirect_to ai_path(@ai)
    redirect_to new_transaction_path
  else
    render :new
  end
end

def index
  @ais = Ai.all.order_by_ais
end


def show
  @ai = Ai.find(params[:id])
  @services = @ai.services
end


def edit
  @ai = Ai.find_by(id: params[:id])
  if !@ai
    redirect_to ais_path
  end
end

def update
  @ai = Ai.find_by(id: params[:id])
  if !@ai
    redirect_to ais_path
  end
  if @ai.update(ai_params)
    redirect_to ai_path(@ai)
  else
    render :edit
  end
end

def destroy
  @ai = Ai.find_by(id: params[:id])
  if !@ai
    redirect_to ais_path
  end
  @ai.destroy
  redirect_to ais_path
end

private

# def set_ai
#   @ai = Ai.find_by(id: params[:id])
#   if !@ai
#     redirect_to ais_path
#   end
# end

def ai_params
  params.require(:ai).permit(:name,:user_id, :description, :balance,
    transactions_attributes:
    [:service_id,
      service_attributes:
      [:name, :description, :price]
      ])

end

end
