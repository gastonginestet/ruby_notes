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
    book_id = params.require(:book_id)
    @note.user = User.find(current_user.id)
    @note.book = Book.find(book_id)
    if @note.save
      redirect_to([:user ,:book , :notes], notice: 'Note was successfully created')
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
      redirect_to([:user ,:book , :notes], notice: 'Note was successfully updated')
    else
      render :edit
    end
  end

  # accion para el borrado de un Note
  def destroy
    @note.destroy
    redirect_to([:user ,:book , :notes], notice: 'Note was successfully deleted')
  end

  private

  def note_params
    params.require(:note).permit(current_user ,:title , :body)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end