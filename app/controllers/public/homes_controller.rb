class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  def top
    @posts = Post.all
  end

  def about
  end
end
