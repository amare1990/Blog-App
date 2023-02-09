class UsersController < ApplicationController
  # before_action :authenticate_user!
  # protect_from_forgery unless: -> { request.format.json? }

  # skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
  end
end
