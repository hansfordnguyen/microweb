require_relative 'application_controller'

class UsersController < ApplicationController
  def index
    @users = User.all
    render :index, users: @users
  end
end
