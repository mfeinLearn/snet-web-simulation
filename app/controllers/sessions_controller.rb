class SessionsController < ApplicationController
  def new
    @user = User.new
    #render :login
  end

  def create
    #byebug
    @user = User.find_by(name: params[:user][:name])
    #raise @user.inspect

    if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  def home
  end

  def destroy
#byebug
    #session.delete :user_id
    session.clear
    redirect_to root_path
  end
end
