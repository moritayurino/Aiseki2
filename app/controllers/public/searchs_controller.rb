class Public::SearchsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @word = params[:word]
    @select = params[:model] 
    if @select == "1"
      @searchs = User.where("name like ?","%#{@word}%")
    elsif @select == "2"
      @genre = Genre.find_by(:name => params[:genre])
      if @genre == nil
        @searchs = Post.where("body like ?","%#{@word}%")
      else
        @searchs = @genre.posts.where("body like ?","%#{@word}%")
      end
    elsif params[:genre].present?
      @genre = Genre.find_by(:name => params[:genre])
      @searchs = @genre.posts
    elsif params[:genre] && @select.empty?
      @searchs = Post.where("body like ?","%#{@word}%")
    end
  end
end
