class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to root_path
    else
      redirect_to topic_path(@topic)
    end
  end

  def about
  end

  private
  
  def topic_params
    params.require(:topic).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @topic.user
  end
end