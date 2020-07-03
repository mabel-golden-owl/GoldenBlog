class UsersController < ApplicationController
  before_action :prepare_user, only: %i[show destroy]

  def index
    @users = User.all
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:notice] = 'User was successfully deleted'
      redirect_back(fallback_location: users_index_path)
    end
  end

  private

  def prepare_user
    @user = User.find(params[:id])
  end

end
