class TracksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def edit
    @track = Track.find(params[:id])
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params) #don't use update_attributes, sometimes creates multiple instances of same id....
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def destroy
    Track.find(params[:id]).destroy
    redirect_to tracks_url
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :type_track)
  end
end
