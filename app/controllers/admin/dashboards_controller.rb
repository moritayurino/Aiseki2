class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @posts = Post.all
  end
  def destroy
    @post.delete
    redirect_to admin_dashboard_path
  end
end
