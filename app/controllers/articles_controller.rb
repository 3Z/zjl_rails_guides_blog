class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    #must new a article here, otherwise new.html.erb @article will be nil when call new_article_path
    #(create action fails and redirect to new action will be safe, since @article passed from create will always not be nil)
    #nil can not call @article.errors.any? (_form.html.erb)
    @article = Article.new
  end

  def create
  	#render plain: params[:article].inspect

  	@article = Article.new(article_params)

    if @article.save
  	  redirect_to article_path(@article)
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
