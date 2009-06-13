# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  # Canonical URLs
  before_filter :canonical_domain
  
  # Lockdown whole app
  before_filter :login_required, :except => [ 'login' ]

  def canonical_domain
    if ENV['CANONICAL_DOMAIN'] and request.host != ENV['CANONICAL_DOMAIN'] then
      if request.query_string.length > 0 then
        query = '?' + request.query_string
      else
        query = ''
      end
      redirect_to request.protocol + ENV['CANONICAL_DOMAIN'] + request.port_string + request.path + query
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
