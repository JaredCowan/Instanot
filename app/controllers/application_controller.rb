class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Mongoid::Errors::DocumentNotFound do redirect_to photos_path end
private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]	
  end
  helper_method :current_user
end
