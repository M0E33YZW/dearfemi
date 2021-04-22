class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/topics/#{comment.topic.id}"
  end

  def destroy
    Comment.find_by(id: params[:id], topic_id: params[:topic_id]).destroy
    redirect_to topics_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
