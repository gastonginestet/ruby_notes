class NotesController < ApplicationController
  before_action :find_note, only: %i[show edit update destroy]
  # index para Note

  def index
    @notes = Note.all
  end
  # acciones para la creacion de un Note

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to(:notes, notice: 'Note was successfully created')
    else
      render :new
    end
  end

  def edit; end

  # accion para la vista de un Note

  def show; end
  # acciones para la edicion de un Note

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  # accion para el borrado de un Note
  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
