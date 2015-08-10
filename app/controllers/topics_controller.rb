class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "topic was saved successfully"
    else
      flash[:error] = "error saving topic, try again!"
      render :edit
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      flash[:notice] = "topic was updated!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "topic was not updated, so log off and grab a clue"
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end
end