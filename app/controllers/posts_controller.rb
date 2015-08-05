class PostsController < ApplicationController

  before_action :flash_attack
  skip_before_action :flash_attack, only: [:new, :index]

  def flash_attack
    flash[:notice] = "this is a serious flash attack!"
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    if @post.save
      flash[:notice] = "post was saved!"
      redirect_to @post
    else
      flash[:error] = "there was an error saving your post. please try again!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "post was updated!"
      redirect_to @post
    else
      flash[:error] = "post was not updated, please try again"
      render :edit
    end
  end

end
