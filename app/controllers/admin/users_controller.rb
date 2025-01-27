class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def show
    id = params[:id].delete(":")
    @user = User.find(id)
    @posts = @user.posts
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
