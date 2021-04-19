class PostsController < ApplicationController
  def create
    Post.create(post_params)
    redirect_to "/topics/#{post.topic.id}"
  end

  private
  def post_params
    params.require(:post).permit(:text, :image,).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
