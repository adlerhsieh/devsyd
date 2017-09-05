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
    @post = Forum::Post.new
  end

  def create
    post = Forum::Post.new(post_params)
    post.user = current_user

    status = post.save ? 1 : 0

    render json: { status: status, post: { id: post.id } }
  end

  def edit
    
  end

  def update
    
  end

  def delete
    
  end

  private

    def post_params
      params.permit(:title, :content)
    end
end
