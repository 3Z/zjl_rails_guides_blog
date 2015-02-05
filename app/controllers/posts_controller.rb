class PostsController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  	# puts "---------", plain: params[:article].inspect

  	@post = Post.new(post_params)
    @post.user_id = params[:user_id]

    @user = User.find(@post.user_id)

    puts "---------", plain: @post.inspect

    if @post.save
  	  redirect_to user_path(@user)
    else
      render 'new'
    end

  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(@user)
  end

  private
  	def post_params
      #TODO :article/:title/:text should has same name with those in form ?
  		params.require(:post).permit(:title, :text)
  	end
end
