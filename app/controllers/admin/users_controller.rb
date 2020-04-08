class Admin::UsersController < Admin::BaseController 
  before_action :find_user, only: [:edit, :update, :delete]
  
  def index 
    @users = AdminUser      
      .order('id desc')
      .paginate(page: params[:page], per_page: 15)   
  end

  def new
    @user = AdminUser.new
  end

  def create
    @user = AdminUser.create(user_params)    
    redirect_to admin_users_path
  end

  def delete
    @user.destroy
    redirect_to admin_users_path    
  end


  protected

  def find_user
    @user = AdminUser.find params[:id]
  end

  def user_params
    params.permit(:login, :password)
  end  
end