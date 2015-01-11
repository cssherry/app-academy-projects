class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
  end

end
