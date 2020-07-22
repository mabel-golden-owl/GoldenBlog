class Admin::BaseController < ActionController::Base
  layout 'admin'
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :check_permission

  private

  def check_permission
    if !current_user.admin?
      redirect_to root_path, alert: 'You are not authenticated.'
    end
  end
end
