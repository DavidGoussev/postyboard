class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = @post.summary
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    @summary.post = @post
    authorize @summary
    if @summary.save!
      flash[:notice] = "your summary has been saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "there was an error with your summary."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:description))
      flash[:notice] = "summary was updated!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "summary was not updated, so log off and grab a clue"
      render :edit
    end
  end



end
