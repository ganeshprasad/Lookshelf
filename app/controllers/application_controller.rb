class ApplicationController < ActionController::Base
 helper :all
  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end

  def access_denied
    flash[:error] = "You do not have access!"
    redirect_to :controller => :user, :action => :new
  end

  def is_user_allowed
    logger.info("called")
    self.current_user = self.current_user || nil
    # if ! current_user.role == "admin"
    if  current_user.nil? #|| current_user.role != "user"
      flash[:error] = "Please login as registered user."
     redirect_to(root_url)
     end
  end
end
