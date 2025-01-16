class Public::SearchsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  @word = params[:word]
  @select = params[:id]
  if @select == "1"
    @searchs = User.where("name like ?","%#{@word}%")
  elsif @select == "2"
    @searchs = Post.where("body like ?","%#{@word}%")
  else
  end
pp @searchs
  end
end
