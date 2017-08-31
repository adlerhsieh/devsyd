class CommentsController < ApplicationController
  def create
    @post = Forum::Post.find(params[:post_id])

    Comment.create!(
      content: params[:content],
      post: @post,
      platform: @post.platform,
      user: current_user
    )

    head :no_content
  rescue => err
    render json: {
      status: "failed",
      message: err.message
    }
  end
end
