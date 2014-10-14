class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @user = User.find(params[:user_id])
    @articles = @user.articles
  end

  def new
    #must new a article here, otherwise new.html.erb @article will be nil when call new_article_path
    #(create action fails and redirect to new action will be safe, since @article passed from create will always not be nil)
    #nil can not call @article.errors.any? (_form.html.erb)
    @user = User.find(params[:user_id])
    @article = @user.articles.new
  end

  def create
  	#render plain: params[:article].inspect

    @user = User.find(params[:user_id])
  	@article = @user.articles.new(article_params)

    if @article.save
  	  redirect_to user_article_path(@user, @article)
    else
      render 'new'
    end

  end

  def show
    #param contains all the :article, only get :id from the hashmap
    @user = User.find(params[:user_id])
  	@article = @user.articles.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  	def article_params
      #TODO :article/:title/:text should has same name with those in form ?
  		params.require(:article).permit(:title, :text)
  	end
end
