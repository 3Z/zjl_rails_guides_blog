
class AdminController < FrontendController
  # include ApplicationHelper
  # include AdminHelper

  layout 'admin/home'
  before_filter :authenticate_user! #, :load_categories

  def title
    "#{current_user.email} | 个人博客管理页面"
  end

  # protected
  # def load_categories
  #   @categories = current_user.categories
  # end
end
