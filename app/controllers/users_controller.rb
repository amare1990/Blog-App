class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    render '/users/index'
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    render 'users/show'
  end
end
