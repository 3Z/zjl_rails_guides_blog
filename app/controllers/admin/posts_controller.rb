class Admin::PostsController < AdminController
  before_action :load_posts, only: [:index, :show, :edit, :update, :destroy]
  before_action :load_user

  def index
    @posts = @posts.includes(:comments)
  end

  def show
    @post = @posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      # flash[:notice] = '你已经成功发布了文章。'
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = @posts.find(params[:id])
  end

  def update
    @post = @posts.find(params[:id])

    if @post.update_attributes(post_params)
      # flash[:notice] = '你已经成功修改了文章。'
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = @posts.find(params[:id])
    @post.destroy

    # flash[:notice] = '你已经成功删除了该文章。'
    redirect_to admin_posts_path
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :text)
  end

end
