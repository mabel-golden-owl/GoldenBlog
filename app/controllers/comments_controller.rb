class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create!(comment_params.merge(user_id: current_user.id))

    redirect_to post_path(@post), notice: 'Comment was successfully created.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
