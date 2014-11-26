class UsersController < ApplicationController

  has_scope :gender, :type => :default
  has_scope :age, :type => :default

  def index
    # @users = User.all
    # @users = User.where(gender: params[:gender]).where("age < ?", params[:age])
    @users = apply_scopes(User).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :gender, :age, :email)
    end
end
