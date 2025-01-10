class UsersController < ApplicationController
  def mypage
    @posts = Post.all
  end

  def show
    id = params[:id].sub(":", "")
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
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def destroy
  end  
end
