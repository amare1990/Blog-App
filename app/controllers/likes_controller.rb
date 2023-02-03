class LikesController < ApplicationController
  def new
    @like = Like.new
    @current_user = current_user
  end

  def create
    @like = Like.new(like_params)
    @like.author = current_user

    if @like.save
      flash.now[:success] = 'You just liked it'
      redirect_to post_show_path(@current_user)
    else
      flash.now[:alert] = 'Like creation failed'
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
