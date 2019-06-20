class SessionsController < ApplicationController
  def new
    @user = User.new
    #render :login
  end

  def create
    #byebug
    if params[:provider] == 'github'
        @user = User.create_by_github_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else

      @user = User.find_by(name: params[:user][:name])
      #raise @user.inspect
      # regular login
      if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = "Sorry, your username or password was incorrect"
        redirect_to '/login'
      end
    end
  end

  def home
  end

  def destroy
    #session.delete :user_id
    session.clear
    redirect_to root_path
  end


  private

  def auth
    request.env['omniauth.auth']
  end
end
