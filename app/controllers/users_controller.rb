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
    correct_user
    @user = User.find(params[:id])
  end

  def update
    correct_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    # 定義したuserと現在ログインしているuserが一致していなければ、ユーザー一覧ページにリダイレクト。
    redirect_to(users_path) unless user == current_user
  end
end
