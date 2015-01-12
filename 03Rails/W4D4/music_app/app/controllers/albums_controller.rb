class AlbumsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    Album.find(params[:id]).destroy # Have to call #Destroy or else dependent: :destroy will not work
    redirect_to albums_url
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :type_album)
  end
end
