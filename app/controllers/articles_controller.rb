class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
  	#render plain: params[:article].inspect
    #puts plain: params[:article].inspect

  	@article = Article.new(article_params)

    if @article.save
      #TODO if there existing create.html.erb in views, not return immediately
      #will cause render create.html.erb?
  	  redirect_to article_path(@article) and return
    else
      render 'new'
    end

  end

  def show
    #param contains all the :article, only get :id from the hashmap
  	@article = Article.find(params[:id])
  end

  def edit
    #param contains all the :article, only get :id from the hashmap
    @article = Article.find(params[:id])
  end

  def update
    #param contains all the :article, see edit.html.erb, form_for :article, url: article_path(@article)
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

  end

  private
  	def article_params
      #TODO :article/:title/:text should has same name with those in form ?
  		params.require(:article).permit(:title, :text)
  	end
end
