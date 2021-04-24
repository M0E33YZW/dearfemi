class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]
  before_action :contributor_confirmation, only: %i[edit update destroy]

  def index
    @topics = Topic.limit(5).order('created_at DESC')
  end

  def new
    @topic = TopicsTag.new
  end

  def create
    @topic = TopicsTag.new(topic_params)
    if @topic.valid?
      @topic.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @comment = Comment.new
    @comments = @topic.comments.includes(:user)
  end

  def edit; end

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

  def about; end

  def search
    @topics = Topic.search(params[:keyword])
  end

  private

  def topic_params
    params.require(:topics_tag).permit(:title, :text, :image, :tagname).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @topic.user
  end
end
