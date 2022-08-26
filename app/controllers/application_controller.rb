class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  



  private
    def after_sign_in_path_for(resource)
      if current_user.roles.blank? && params[:user][:roles]
        role = Role.find_by(field: params[:user][:roles])
        current_user.roles << role if role
      end
      if current_user.roles.first.field == 'Customer'
        return bookings_path
      elsif current_user.roles.first.field == 'Property Owner'
        return properties_path
      end
    end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :full_name, :account_no) } 
    end
end
