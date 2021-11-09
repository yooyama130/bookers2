class UsersController < ApplicationController
  def index
    @user = current_user
    @new_book = Book.new
    @all_users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
