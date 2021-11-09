class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @all_users = User.all;
  end
end
