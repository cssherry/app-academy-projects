class CheersController < ApplicationController

  def create
    @cheer = Cheer.new(cheer_params)
    @cheer.save
    flash[:errors] = @cheer.errors.full_messages
    redirect_to goal_url(@cheer.goal_id)
  end

  def leaderboard

  end

  private
  def cheer_params
    parameter = {}
    parameter[:goal_id] = params[:goal_id]
    parameter.merge(awarder_id: current_user.id)
  end
end
