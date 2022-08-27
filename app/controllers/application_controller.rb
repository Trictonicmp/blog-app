class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json, :html

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
