
class AdminController < FrontendController
  # include ApplicationHelper
  # include AdminHelper

  # layout 'admin/home'

  before_filter :authenticate_user!

  def title
    "#{current_user.email} | 个人博客管理页面"
  end

  protected
  def load_user
    @user = current_user
  end

  def load_articles
    @articles = current_user.articles
  end

  def load_photos
    @photos = current_user.photos
  end

end
