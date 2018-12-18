class Admin::UsersController < Admin::Base
  def index
    @users = User.all
  end
  
  def approve_user
    if current_user.admin?
      user = User.find params[:id]
      if user.update(approved: true)
        redirect_to admin_users_path, notice: 'User was successfully approved.'
      else
        flash.now[:alert] = 'An error happened in the User. Please try again.'
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
end
