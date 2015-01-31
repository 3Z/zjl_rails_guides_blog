class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
  	# puts "---------", plain: params[:article].inspect

  	@article = Article.new(article_params)
    @article.user_id = params[:user_id]

    @user = User.find(@article.user_id)

    # puts "---------", plain: @article.inspect

    if @article.save
  	  redirect_to user_path(@user)
    else
      render 'new'
    end

  end

  def show
  	@article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @article.destroy

    redirect_to user_path(@user)
  end

  private
  	def article_params
      #TODO :article/:title/:text should has same name with those in form ?
  		params.require(:article).permit(:title, :text)
  	end
end
