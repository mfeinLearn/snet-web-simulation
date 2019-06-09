class AisController < ApplicationController

def new
#  byebug
  @ai = Ai.new
end

def create
  @ai = Ai.create(ai_params)
  @user = User.find(current_user.id)
  if @ai.save
    redirect_to ai_path(@ai)
  else
    render :new
  end
end

def index
  @ais = Ai.all
end

def show
  set_ai
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
  params.require(:ai).permit(:name,:user_id, :description, :balance )

end

end
