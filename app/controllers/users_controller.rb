class UsersController < ApplicationController
  def index
    render '/users/index'
  end

  def show
    render 'users/show'
  end
end
