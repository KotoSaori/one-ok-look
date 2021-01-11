class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_admin, :logged_in?
  
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:id])
  end

  def logged_in?
    !current_admin.nil?
  end
  
end
