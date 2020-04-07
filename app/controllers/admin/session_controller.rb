class Admin::SessionController < Admin::BaseController
  skip_before_action :login_required  
  skip_before_action :verify_authenticity_token

  
  layout false
  
  def login
    if request.post?
      admin_user = AdminUser.find_by(login: params[:username])
      admin_user ||= AdminUser.find_by(username: params[:username])      
      if admin_user && admin_user.authenticate(params[:password])        
        login_as(admin_user)
        redirect_to admin_root_path
      else
        flash[:alert] = '错误密码'
      end
    end
  end

  def sign_out
    logout
    redirect_to login_admin_session_index_path
  end

end