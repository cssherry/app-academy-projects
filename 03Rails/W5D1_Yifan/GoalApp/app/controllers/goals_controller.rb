class GoalsController < ApplicationController
  def new

  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(current_user)
  end

  def completed
    @goal = Goal.find(params[:id])
    @goal.update(completed: "true")
    redirect_to user_url(current_user)
  end

  def show
    @goal = Goal.find(params[:id])
  end
  
  private
  def goal_params
    params.require(:goal).permit(:body, :status)
    .merge({user_id: current_user.id})
  end
end
