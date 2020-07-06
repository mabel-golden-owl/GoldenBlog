class Admin::BaseController < ActionController::Base
  layout 'application'
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :check_permission

  private

  def check_permission
    redirect_to root_path unless current_user.admin?
  end
end
