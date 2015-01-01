
class Frontend::HomeController < FrontendController
  def index
    @users = User.all
  end
end
