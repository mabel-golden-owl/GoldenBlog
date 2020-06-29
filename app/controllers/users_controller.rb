class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = 'User was successfully deleted'
      redirect_back(fallback_location: users_index_path)
    end
  end

end
