class SessionsController < ApplicationController
  def new
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      #Save the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
  end

  def create
    redirect_to '/login'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
