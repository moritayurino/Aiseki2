class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  def top
    @posts = Post.all.order(created_at: :desc)
  end
  
  def about
  end
end
