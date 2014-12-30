class Frontend::HomeController < ApplicationController
  def index
    @users = apply_scopes(User).all
  end
end
