class UsersController < ApplicationController

  # has_scope :by_gender, :type => :default
  # has_scope :haha_age, :type => :default

  def index
    # @users = User.all
    # @users = User.where(gender: params[:gender]).where("age < ?", params[:age])
    # @users = apply_scopes(User).all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @photos = @user.photos
  end

end
