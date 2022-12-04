class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Successfully post updated !'
    else
      redirect_to edit_post(@post), alert: 'Oops! Failed to update!'
    end

  end

  private

  def post_params
    params.require(:post).permit(:content, :location, :category, :title, :photo)
  end

end
