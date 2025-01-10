class SearchsController < ApplicationController
  def new
  end
  def index
  @word = params[:word]
  @select = params[:id]
  if @select == "1"
    @searchs = User.where("name like ?","%#{@word}%")
  elsif @select == "2"
    @searchs = Post.where("body like ?","%#{@word}%")
  else
    @searchs = 
  end
  end
end
