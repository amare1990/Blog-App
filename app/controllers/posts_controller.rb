class PostsController < ApplicationController
  def index
    render '/posts/index'
  end

  def show
    render '/posts/show'
  end
end
