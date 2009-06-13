# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  # Lockdown whole app
  before_filter :login_required, :except => [ 'login' ]
  
  # Canonical URLs
  if ENV['CANONICAL_DOMAIN'] then
    before_filter :canonical_domain
  end

  def canonical_domain
    if request.env['HTTP_HOST'] != ENV['CANONICAL_DOMAIN']
      redirect_to ENV['CANONICAL_DOMAIN']
    end
  end
  
  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "users", :action => "login"
    return false 
  end

  def current_user
    session[:user]
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to return_to
    else
      redirect_to '/'
    end
  end
end
