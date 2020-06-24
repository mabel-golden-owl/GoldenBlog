class LikesController < ApplicationController
  before_action :prepare_post, only: %i[create destroy]

  def create
    @post.likes.create(user_id: current_user.id)

    redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    redirect_to post_path(@post)
  end

  private

  def prepare_post
    @post = Post.find(params[:post_id])
  end
end
