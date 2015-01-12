class CommentsController < ApplicationController
  #/[users,contacts]/:[user,contact]_id/comments

  def index
    @commentable = find_commentable
    render json: @commentable.comments
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment].permit(:title, :body))
    if @comment.save
      render json: @comment
    else
      render text: @comment.errors.full_messages
    end
  end

  # /comments/:id

  def show
    render json: Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    Comment.update(@comment.id, params[:comment])
    if @comment.errors.empty?
      render json: @comment
    else
      render text: @comment.errors.full_messages
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    Comment.destroy(params[:id])
    render json: @comment
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
