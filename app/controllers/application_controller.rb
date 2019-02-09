class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone, :name, :address])
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role? :user
      students_path
    else
      admin_index_path
    end
  end

end
