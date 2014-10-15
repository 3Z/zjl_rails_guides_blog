class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to user_article_path(@user, @article)
  end

  def edit
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find([:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to user_article_path(@user, @article)
  end

  def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to user_article_path(@user, @article)
  end

  private
    def comment_params
      #TODO params naming rules(also in form)
      params.require(:comment).permit(:commenter, :body)
    end
end
