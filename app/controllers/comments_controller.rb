class CommentsController < ApplicationController
  before_action :find_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @article.comments.new
  end

  def edit
  end

  def create
    @comment = @article.comments.new(comment_params)
    set_comment_author(@comment)
    if @comment.save
      flash[:success] = 'Comment added, pending admin approval'
      redirect_to @article
    else
      flash[:error] = "Comment could not be saved"
      render :new
    end
  end

  def url_options
    { article_id: params[:article_id] }.merge(super)
    # this is overwriting the url_options which is in application_controller
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = "Updated comment."
      redirect_to @article
    else
      flash[:error] = "That comment could not be saved."
      render :edit
    end
  end

  def destroy
    @comment.destroy
    if @comment.destroy
      flash[:success] = "Comment was deleted."
    else
      flash[:error] = "Comment could not be deleted."
    end
    redirect_to @article
  end

  private

  def set_comment_author(comment)
    if current_user
      @comment.username = current_user.name
      @comment.user = current_user
    else
      @comment.username = "Anonymous"
    end
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :published)
  end
end
