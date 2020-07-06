class Admin::UsersController < Admin::BaseController
  before_action :prepare_user, only: %i[show destroy]
  skip_before_action :check_permission, only: %i[show]

  def index
    @users = User.all
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:notice] = 'User was successfully deleted.'
      redirect_back(fallback_location: admin_users_path)
    end
  end

  private

  def prepare_user
    @user = User.find(params[:id])
  end
end
