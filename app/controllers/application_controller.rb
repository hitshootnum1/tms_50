class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t "not_authorized"
    redirect_to root_url
  end

  def current_ability
    namespace = controller_path.split("/").first
    Ability.new current_user, namespace
  end

  def after_sign_in_path_for resource
    current_user.supervisor? ? admin_root_path : user_path(current_user)
  end
end
