class UsersController < ApplicationController
  def index
    @user = current_user
    @new_book = Book.new
    @all_users = User.all
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end
end
