class UsersController < ApplicationController
#loading the signup form
  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
    #login the user
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
  end
  def show
    @user = User.find(params[:id]) #define instance variable for view
    #byebug
    if logged_in?
      @user.update(:data => @user.data + 1)
      @user.save
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :data)
  end
end
