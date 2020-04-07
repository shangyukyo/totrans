class Admin::BaseController < ApplicationController
  layout 'admin'
  helper_method :current_user, :login?
  before_action :login_required

  class AdminAccessDenied < Exception; end
  
  def login_required  
    return if login?  
    redirect_to login_admin_session_index_path(return_to: request.fullpath, protocol: 'https://')    
  end

  def login?    
    !!current_user
  end

  def login_as(user)    
    session[:admin_user_id] = user.id
    @current_user = user        
  end

  def logout
    @current_user = nil
    session[:admin_user_id] = nil
    session[:client_headers] = nil
  end

  def current_user
    @current_user ||= login_from_session unless defined?(@current_user)
    @current_user
  end

  def login_from_session
    if session[:admin_user_id].present?
      begin
        AdminUser.find(session[:admin_user_id])
      rescue
        session[:admin_user_id] = nil
      end
    end
  end   
end