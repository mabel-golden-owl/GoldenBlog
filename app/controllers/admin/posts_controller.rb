class Admin::PostsController < ApplicationController
  before_action :prepare_post, only: %i[show destroy]
  before_action :prepare_new_posts, only: %i[index manage]

  def index
    @approved_posts = prepare_status_posts('Approved')
    @declined_posts = prepare_status_posts('Declined')
  end

  def show
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy

    flash[:notice] = 'Post was successfully destroyed.'
    redirect_back(fallback_location: admin_posts_path)
  end

  def manage; end

  private

  def prepare_post
    @post = Post.find(params[:id])
  end

  def prepare_status_posts(status)
    Post.where(status: status).order('created_at')
  end

  def prepare_new_posts
    @new_posts = prepare_status_posts('New')
  end

end
