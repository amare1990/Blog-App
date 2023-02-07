class PostsController < ApplicationController
  def index
    # @current_user = current_user
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: params[:user_id])
    render '/posts/index'
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    # @current_user = current_user
    @comments = Comment.all
    render '/posts/show'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash.now[:notice] = "Successfully posted"
      redirect_to user_path(@current_user)
    else
      flash.now[:error] = "Error in posting"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
