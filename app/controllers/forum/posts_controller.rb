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

  def new
    if not current_user
      redirect_to new_user_session_path(nil, s: 1, r: URI(request.referer).path)
    end
    @post = Post.new
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def delete
    
  end
end
