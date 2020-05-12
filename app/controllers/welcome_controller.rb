class WelcomeController < ApplicationController

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale    
    cookies[:locale] = I18n.locale    
  end

  def blog    
    @blog = Topic.find_by_slug params[:slug]
  end

  def blogs
    @blogs = Topic.order('id DESC')
    if params[:month].present?
      month, year = params[:month].split("月")
      date = Time.mktime(year, month)
      @blogs = @blogs.where("created_at > ? and created_at < ?", date.at_beginning_of_month, date.end_of_month)
    end
    @blogs = @blogs.paginate(page: params[:page], per_page: 15)
  end
end