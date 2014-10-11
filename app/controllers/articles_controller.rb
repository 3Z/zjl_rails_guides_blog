class ArticlesController < ApplicationController
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
    #puts plain: params[:article].inspect

  	@article = Article.new(article_params)

    if @article.save
      #no need add "and return, redirect_to will stop render create.html.erb if exists"
  	  redirect_to article_path(@article)
      #although add "and return" here, still rendering create.html.erb if exists
      #TODO that means "and return" no use?
      #puts "test" and return
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
