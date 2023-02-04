class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: params[:user_id])
    render '/posts/index'
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @current_user = current_user
    @comments = Comment.all
    render '/posts/show'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_path(@current_user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
