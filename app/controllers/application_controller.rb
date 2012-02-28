class ApplicationController < ActionController::Base
  
  layout "standard"
  before_filter :require_login
  skip_before_filter :require_login, :only => [:login, :check_login,:home]

  def require_login
    if session[:student].nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to :action=>'login' # halts request cycle
    end
  end
  
  def current_user
    return session[:student]
  end
end
