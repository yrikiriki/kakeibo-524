class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'riki' && password == '0524'
    end
  end
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture_id, :city])
  end
end
