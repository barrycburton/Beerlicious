class UsersController < ApplicationController
  
  # Require Auth
  before_filter :login_required, :except => [ 'login' ]
  
  
  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:name], params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to_stored
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end

end
