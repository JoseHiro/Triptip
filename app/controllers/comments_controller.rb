class CommentsController < ApplicationController
  def index

  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_param)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer, notice: "Success!"
    else
      redirect_to request.referer, notice: "Failed to leave a comment..."
    end
  end


  private

  def comment_param
    params.require(:comment).permit(:text)
  end
end
