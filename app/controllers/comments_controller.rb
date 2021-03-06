class CommentsController < ApplicationController
  def create
    @post = Forum::Post.find(params[:post_id])

    raise "No script tag allowed." if params[:content].include?("script")

    Comment.create!(
      content: params[:content],
      post: @post,
      platform: @post.platform,
      user: current_user
    )

    render json: {
      status: 1,
      datetime: Time.zone.now.strftime("%Y-%m-%d %H:%M:%S")
    }
  rescue => err
    render json: {
      status: 0,
      message: err.message
    }
  end
end
