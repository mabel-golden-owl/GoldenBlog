class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to post_path(@post)
  end
end
