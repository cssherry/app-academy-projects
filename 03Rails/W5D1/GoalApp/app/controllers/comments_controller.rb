class CommentsController < ApplicationController
  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to get_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to get_url
  end

  def get_url
    case @comment.commentable_type
    when "Comment"
      while @comment.commentable_type == "Comment"
        @comment = Comment.find(@comment.commentable_id)
      end
      @comment.commentable_type == "User" ? user_url(@comment.commentable_id) : goal_url(@comment.commentable_id)
    when "User"
      user_url(@comment.commentable_id)
    when "Goal"
      goal_url(@comment.commentable_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
    .merge(commentable_id: params[:id], commentable_type: params[:type], author_id: current_user.id)
  end
end
