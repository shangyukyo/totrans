class WelcomeController < ApplicationController

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale    
    cookies[:locale] = I18n.locale    
  end

  def topic    
    @topic = Topic.find_by_slug params[:slug]
  end

end