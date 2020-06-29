class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :prepare_post, only: %i[show destroy]

  def index
    @posts = Post.all
  end

  def new
    @categories = Category.all
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      redirect_to new_post_path, alert: 'Please fill in all fields.'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit, alert: 'Please fill in all field.'
    end
  end

  def show
    if current_user
      @pre_like = @post.likes.find { |like| like.user_id == current_user.id }
    end
  end

  def destroy
    @post.destroy

    redirect_back(fallback_location: root_path)
    flash[:notice] = 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :category_id)
  end

  def prepare_post
    @post = Post.find(params[:id])
  end
end
