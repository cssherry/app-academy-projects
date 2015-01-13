class UserCommentsController < ApplicationController
  def create
    @comment = UserComment.new(comment_params)
    @comment.save
    redirect_to user_url(params[:id])
  end

  def destroy
    @comment = UserComment.find(params[:id])
    @user = @comment.user
    @comment.destroy
    redirect_to user_url(@user)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: params[:id], parent_id: params[:parent_id])
  end
end
