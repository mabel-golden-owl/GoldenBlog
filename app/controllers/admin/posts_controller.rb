class Admin::PostsController < Admin::BaseController
  before_action :prepare_post, only: %i[show destroy]

  def index
    @new_posts = prepare_status_posts('New')
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

  private

  def prepare_post
    @post = Post.find(params[:id])
  end

  def prepare_status_posts(status)
    Post.where(status: status).order('created_at')
  end

end
