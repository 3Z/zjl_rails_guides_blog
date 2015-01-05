
class Admin::HomeController < AdminController
  before_action :load_user
  
  def index
    @articles = @user.articles
  end

  def profile
  end

  def update_profile
  end

  private
  def load_user
    @user = current_user
  end

end
