class LikesController < ApplicationController
  before_action :prepare_post, only: %i[create destroy]

  def create
    byebug
    @liked = @post.likes.create(user_id: current_user.id)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show; end

  private

  def prepare_post
    @post = Post.find(params[:post_id])
  end
end
