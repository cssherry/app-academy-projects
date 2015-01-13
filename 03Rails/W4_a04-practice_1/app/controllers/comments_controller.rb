class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @link = Link.find(params[:link_id])
    if @comment.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(@link)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @link = Link.find(@comment.link_id)
    @comment.destroy
    redirect_to link_url(@link)
  end

  private
  def comment_params
    parameters = params.require(:comment).permit(:body)
    parameters[:user_id] = current_user.id
    parameters[:link_id] = params[:link_id]
    parameters
  end
end
