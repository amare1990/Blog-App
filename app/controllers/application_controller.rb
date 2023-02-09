class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name password])
    # params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   else
  #     super # Use the default one
  #   end
  # end
end
