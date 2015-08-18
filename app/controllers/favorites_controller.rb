class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
      authorize favorite
    if favorite.save
      flash[:notice] = "post successfully favorited"
      redirect_to [post.topic, post]
    else
      flash[:error] = "post not favorited, please try again"
      redirect_to [post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
      authorize favorite
    if favorite.destroy
      flash[:notice] = "post successfully unfavorited"
      redirect_to [post.topic, post]
    else
      flash[:error] = "post not unfavorited, please try again"
      redirect_to [post]
    end
  end

end
