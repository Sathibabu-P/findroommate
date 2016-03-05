class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authenticate_user!
  layout :layout_by_resource
  protect_from_forgery with: :exception
   rescue_from CanCan::AccessDenied do |exception|
    redirect_to rooms_path, :alert => exception.message
  end

  # def after_sign_in_path_for(resource)
  # 	#request.referrer if resource == ''
  # end
  protected

	def layout_by_resource
	  
	    "admin" if devise_controller? && resource_name == :admin
	  
	end
end
