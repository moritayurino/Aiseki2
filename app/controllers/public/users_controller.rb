class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :show, :edit, :update, :destroy]

  def mypage
    @posts = Post.all
  end

  def show
    id = params[:id].delete(":")
    @user = User.find(id)
    @posts = @user.posts
  end

  def edit
    id = params[:id].sub(":", "")
    @user = User.find(id)
  end

  def update
    id = params[:id].sub(":", "")
    @user = User.find(id)
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def destroy
      @user = User.find(params[:id]) 
      @user.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to new_user_registration_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
