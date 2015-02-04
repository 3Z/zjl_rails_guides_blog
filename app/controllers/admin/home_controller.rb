
class Admin::HomeController < AdminController
  before_action :load_user, :load_articles, :load_photos
  
  def index
  end

  def profile
  end

  def update_profile
  end

end
