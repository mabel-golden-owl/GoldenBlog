class PostsController < ApplicationController
  before_action :prepare_post, only: %i[show destroy]

  def index
    @posts = Post.all
  end

  def new; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def show
    if current_user
      @pre_like = @post.likes.find { |like| like.user_id == current_user.id }
    end
  end

  def destroy
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def prepare_post
    @post = Post.find(params[:id])
  end
end
