class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    # @current_user = current_user
    # @comment.author = @current_user
    # @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    @comment = Comment.new(comments_params)
    @current_user = current_user
    @post = Post.find(params[:id])
    @comment.author = @current_user
    @comment.post = @post

    if @comment.save
      flash.now[:notice] = 'Commented successfully!'
      redirect_to post_show_path(@current_user)
    else
      flash.now[:error] = 'Commenting failed!!'
      render 'new'
    end
  end

  def under_construction; end

  private

  def comments_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
