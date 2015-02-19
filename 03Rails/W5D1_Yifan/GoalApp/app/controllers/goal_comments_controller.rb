class GoalCommentsController < ApplicationController


  def create
    @comment = GoalComment.new(comment_params)
    @comment.save
    redirect_to goal_url(params[:id])
  end

  def destroy
    @comment = GoalComment.find(params[:id])
    @goal = @comment.goal
    @comment.destroy
    redirect_to goal_url(@goal)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(goal_id: params[:id], parent_id: params[:parent_id])
  end
end
