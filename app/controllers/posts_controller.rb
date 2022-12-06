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
    @markers = [
      {
        lat: @post.latitude,
        lng: @post.longitude,
        info_window: render_to_string(partial: "popup", locals: {post: @post})
      }]
  end

  def index
    @comment = Comment.new
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "popup", locals: {post: post})
      }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Successfully updated !'
    else
      redirect_to edit_post(@post), alert: 'Oops! Failed to update!'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path, notice: "Successfully deleted"
    else
      redirect_to post_path, alert: "Failed to delete"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :address, :category, :title, :photo)
  end

end
