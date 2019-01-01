class Admin::UsersController < Admin::Base
  before_action :set_user, only: [:approve_user, :update_role]

  def index
    @users = User.all
  end

  def update_role
    if current_user.admin?
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User Role was successfully updated.'
      else
        flash.now[:alert] = 'An error was happened. Please try again.'
      end
    else
      flash.now[:alert] = "You aren't Admin"
    end
  end

  def approve_user
    if current_user.admin?
      if @user.update(approved: true)
        redirect_to admin_users_path, notice: 'User was successfully approved.'
      else
        flash.now[:alert] = 'An error was happened. Please try again.'
      end
    else
      flash.now[:alert] = "You aren't Admin"
    end
  end

  def destroy
    if current_user.admin?
      user = User.find params[:id]
      user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: 'Post was successfully destroyed.' }
      end
    else
      flash.now[:alert] = "You aren't Admin"
    end
  end

  private
    def set_user
      @user = User.find params[:id]
    end
    def user_params
      params.require(:user).permit(:role)
    end
end
