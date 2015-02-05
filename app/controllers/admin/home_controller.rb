
class Admin::HomeController < AdminController
  before_action :load_user, :load_posts, :load_photos
  
  def index
    puts "admin/home#index, params[:page]", params[:page]
  end

  def profile
  end

  def update_profile
  end

end
