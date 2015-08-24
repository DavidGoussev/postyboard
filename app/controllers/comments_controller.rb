class CommentsController < ApplicationController

  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    @comment.user = current_user
  #  @post = Post.new(post_params)
  #  @comment = @post.comments
  #  @comment.user = current_user
  #  @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "comment was saved!"
      redirect_to [@post.topic, @post]
      #redirect_to :back
    else
      @comments = @post.comments
      @topic = @post.topic
      flash[:error] = "there was an error saving your comment. please try again! minimum comment length is 5 characters."
      #render 'topics/posts/show'
      redirect_to [@post.topic, @post]
    end
  end

def destroy
  #@topic = Topic.find(params[:topic_id])
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])

  authorize @comment
  if @comment.destroy
    flash[:notice] = "comment was removed"
    #redirect_to [@post.topic, @post]
  else
    flash[:error] = "comment was not removed"
    #redirect_to [@post.topic, @post]
  end

  respond_to do |format|
    format.html
    format.js
  end
end


  private

  def comments_params
    params.require(:comment).permit(:body)
  end

end
