class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to user_article_path(@user, @article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      #TODO params naming rules(also in form)
      params.require(:comment).permit(:commenter, :body)
    end
end
