class UsersController < ApplicationController
  def index
    render '/users/index'
  end

  def user
    render 'users/show'
  end
end
