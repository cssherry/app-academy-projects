class LinksController < ApplicationController
  before_action :redirect_if_logged_out

  def index
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private
  def link_params
    params.require(:link).permit(:title, :url).merge(user_id: current_user.id)
  end
end
