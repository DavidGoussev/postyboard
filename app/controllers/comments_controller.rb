class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    @comment.user = current_user
  #  @post = Post.new(post_params)
  #  @comment = @post.comments
  #  @comment.user = current_user
  #  @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "comment was saved!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "there was an error saving your comment. please try again!"
      redirect_to [@topic, @post]
    end
  end



  private

  def comments_params
    params.require(:comment).permit(:body)
  end

end
