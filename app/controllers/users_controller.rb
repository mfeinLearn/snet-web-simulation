class UsersController < ApplicationController
#loading the signup form
  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
    #login the user
    if @user.save # if the user does not save it will automatically
      # add the method @user.errors - it will add all of the error messages
      # in there(errors)| @user.errors - now it will have information about
      # the user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #byebug
      render :new
    end
  end

  def index
    #byebug
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
