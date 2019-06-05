class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #binding.pry
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  private

  def user_params
    params.require(:user).permit(:name, :password, :data)
  end
end
