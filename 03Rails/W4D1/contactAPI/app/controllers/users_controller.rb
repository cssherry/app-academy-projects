class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages #, status: :unprocessable_entity
    end
  end

  def new
    render text:"I'm in the new action"
  end

  def edit
    render text:"I'm in the edit action"
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    User.update(@user.id, user_params)
    if @user.errors.empty?
      render json: @user
    else
      render text: @user.errors.full_messages
    end
  end

  def destroy
    @user = User.find(params[:id])
    User.destroy(params[:id])
    render json: @user
  end

  private
  def user_params
    params[:user].permit(:username)
  end
end
