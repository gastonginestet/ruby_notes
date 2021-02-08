class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]
  # index para Book

  def index
    @books = Book.where(user_id: current_user.id)
  end
  # acciones para la creacion de un Book

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = User.find(current_user.id)
    if @book.save
      redirect_to([:user, :books], notice: 'Book was successfully created')
    else
      render :new
    end
  end

  def edit; end

  # accion para la vista de un Book

  def show; end
  # acciones para la edicion de un Book

  def update
    if @book.update(book_params)
      redirect_to([:user, :books], notice: 'Book was successfully updated')
    else
      render :edit
    end
  end

  # accion para el borrado de un Book
  def destroy
    @book.destroy
    redirect_to([:user, :books], notice: 'Book was successfully deleted')
  end

  def export
    byebug
    book_id = params.require(:book_id)
    Note.where(book_id:book_id) do |note|
      file_data = note.body
      file_data = CommonMarker.render_html(file_data,:DEFAULT)
      new_exported_file = "#{note.title}.html"
      p file_data
    end
    redirect_to([:user, :books], notice: 'Book was successfully exported')
  end
  private

  def book_params
    params.require(:book).permit(current_user, :title)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
