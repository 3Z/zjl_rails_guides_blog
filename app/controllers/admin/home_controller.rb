
class Admin::HomeController < AdminController
  before_action :load_user, :load_posts, :load_photos
  
  def index
    # puts "admin/home#index, params[:page]", params[:page]
    @posts = @posts.includes(:comments)
  end

  def profile
  end

  def update_profile
  end

end
