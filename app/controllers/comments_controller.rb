class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:id])
    render :comments
  end

  def create
    @post = Post.find(params[:id])
    @post.comments.create(body: params[:body], user_id: current_user.id)
    redirect_to comments_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
    render :comments_edit
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(body: params[:body])
    post = Post.find_by(id: comment.post_id)
    redirect_to comments_path(post)
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
    post  = Post.find_by(id: comment.post_id)
    redirect_to comments_path(post)
  end

end