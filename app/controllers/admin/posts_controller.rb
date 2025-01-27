class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to admin_dashboards_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :address, :genre_id)
  end
end
