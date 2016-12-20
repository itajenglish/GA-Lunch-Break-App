class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  protected

  def authenticate_user
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = User.find(session[:user_id])
      true
    else
      redirect_to(controller: 'sessions', action: 'login')
      false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to(controller: 'sessions', action: 'home')
      false
    else
      true
    end
  end

end
