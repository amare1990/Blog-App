class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    render '/posts/index'
  end

  def show
    @post = Post.find(params[:id])
    render '/posts/show'
  end
end
