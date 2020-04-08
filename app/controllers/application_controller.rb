class ApplicationController < ActionController::Base
  before_action :set_current_locale
  
  def set_current_locale
    I18n.locale = cookies[:locale] || I18n.default_locale    
  end  
end
