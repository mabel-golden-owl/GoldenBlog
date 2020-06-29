class PagesController < ApplicationController

  def showtop; end

  def create_posts
    # group today posts
    @posts_today = Post.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_day, Time.now)
    @posts_today = get_posts(@posts_today)

    # group weekly posts
    @posts_weekly = Post.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_week, Time.now.end_of_week)
    @posts_weekly = get_posts(@posts_weekly)

    # group monthly posts
    @posts_monthly = Post.where('created_at BETWEEN ? AND ?', Time.now.beginning_of_month, Time.now.end_of_month)
    @posts_monthly = get_posts(@posts_monthly)

    @choice = params[:choice]

    @posts = if @choice == 'Today'
               @posts_today
             elsif @choice == 'Week'
               @posts_weekly
             else
               @posts_monthly
             end

    render 'pages/showtop', notice: "Show top posts of #{@choice}"
  end

  private

  def get_posts(posts)
    posts.sort_by { |p| -p.likes.count }.first 2
  end

end
