class NotesController < ApplicationController
  def index
    @notes = Note.where(user_id: current_user.id)
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params) #don't use update_attributes, sometimes creates multiple instances of same id....
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :edit
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_url
  end

  private

  def note_params
    parameters = params.require(:note).permit(:track_id, :note)
    parameters[:user_id] = current_user.id
    parameters
  end
end
