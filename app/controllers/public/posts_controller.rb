class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :new, :edit, :update, :destroy] 
  def new
    @post = Post.new
  end

  def index
      respond_to do |format|
        format.html do
          @posts = Post.page(params[:page])
        end
        format.json do
          @posts = Post.all
        end
      end
    @genres = Genre.all
    @posts = Post.all
    @posts = @posts.where(genre_id: params[:genre_id]) if params[:genre_id].present?
  end

  def show
    
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
        redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])

    if current_user
      post.user_id = current_user.id
    post.destroy
    redirect_to user_path(post.user.id)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :address, :genre_id)
  end
end
