class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    post = current_user.posts.create(title: params[:title],
                                     link: params[:link])
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:title],
                 link: params[:link])
    redirect_to posts_path
  end

  def index
    @posts = Post.page(params[:page]).per(20)
    render :index
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id
      flash[:notice] = "Destroyed the post: #{post.title}"
      post.destroy
    else
      flash[:notice] = "That's not yours to delete."
    end
    redirect_to posts_path
  end

end
