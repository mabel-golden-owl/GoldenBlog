class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :prepare_post, only: %i[show destroy]

  def index
    @posts = Post.all
  end

  def new
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      redirect_to new_post_path, alert: 'Please fill in all fields.'
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

  def top
    @posts = Post.all
    @posts = if params[:choice] == 'Today'
               @posts.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_day, Time.now)
             elsif params[:choice] == 'Week'
               @posts.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_week, Time.now.end_of_week)
             elsif params[:choice] == 'Month'
               @posts.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_month, Time.now.end_of_month)
             else
               Post.none
            end.sort_by { |p| -p.likes.count }.first 2

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :category_id)
  end

  def prepare_post
    @post = Post.find(params[:id])
  end
end
