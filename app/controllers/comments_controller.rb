class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:id])
    render :comments
  end

  def create
    @post = Post.find(params[:id])
   comment = current_user.comments.create(body: params[:body])
   redirect_to comments_show_path
  end

  def edit
    @comment = Comment.find(params[:id])
    render :comments_edit
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(body: params[:body])
  end

  ##def show
  ##  @comment = Comment.find(params)
  ##end

  def destroy
      comment = Comment.find(params[:id])
    if current_user.id == comment.user_id
      flash[:notice] = "The comment has been deleted."
      comment.destroy
    else
      flash[:notice] = "Sorry, you can't delete that, you ass."
    end
    redirect_to comments_show_path
  end

end