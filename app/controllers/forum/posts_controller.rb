class Forum::PostsController < ApplicationController
  def index
    @posts = Forum::Post.all
  end
end
