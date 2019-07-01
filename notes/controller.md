


Session controller
  def welcome
  end

  # destroy - objects
  # delete - session
  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new
  
  end
