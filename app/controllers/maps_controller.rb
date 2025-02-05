class MapsController < ApplicationController
  def show
    results = Geocoder.search(params[:location])
    if results.empty?
      flash[:error] = "検索フォームに文字が入っていないか、位置情報を取得できる値でない可能性があります。"
      redirect_to root_path
    else
      selection = params[:keyword]
      @latitude = results.first.coordinates[0]
      @longitude = results.first.coordinates[1]
      posts = Post.within_box(20, @latitude, @longitude)
      case selection
      when 'near'
        @posts = Post.near(results.first.coordinates, 20)
      else
        @posts = posts
      end
    end
    respond_to do |format|
      format.html do
        @posts
      end
      format.json do
        @posts
      end
    end
  end
end
