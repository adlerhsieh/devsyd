class Forum::PostsController < ApplicationController
  def index
    @posts = Forum::Post.includes(:user).all
  end

  def show
    @post = Forum::Post.find(params[:id])
    @comments = @post.comments.includes(:user)

    gon.push(
      post: {
        id: @post.id
      }
    )
  end
end
