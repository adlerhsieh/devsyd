class Forum::PostsController < ApplicationController
  def index
    @posts = Forum::Post.includes(:user).all
  end

  def show
    @post = Forum::Post.find(params[:id])
  end
end
