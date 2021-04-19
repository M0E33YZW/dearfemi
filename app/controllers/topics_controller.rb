class TopicsController < ApplicationController
  def index
    @topics = Topic.includes(:user).order("created_at DESC")
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :index
    end    
  end

  def about
  end

  private
  
  def topic_params
    params.require(:topic).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
