class BooksController < ApplicationController
  require 'zip'
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
      redirect_to(%i[user books], notice: 'Book was successfully created')
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
      redirect_to(%i[user books], notice: 'Book was successfully updated')
    else
      render :edit
    end
  end

  # accion para el borrado de un Book
  def destroy
    @book.destroy
    redirect_to(%i[user books], notice: 'Book was successfully deleted')
  end

  def export
    book_id = params.require(:book_id)
    book = Book.find(book_id)
    filename = "#{book.title}.zip"
    temp_file = Tempfile.new(filename)
    begin
      Zip::OutputStream.open(temp_file) { |zos| }
      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zipfile|
        Book.find(book_id).notes.each do |note|
          data = CommonMarker.render_html(note.body, :DEFAULT)
          file = Tempfile.new("#{note.title}.html")
          file.write(data)
          file.close
          zipfile.add("#{note.title}.html", file)
        end
      end
      zip_data = File.read(temp_file.path)
      send_data(zip_data, type: 'application/zip', filename: filename)
    ensure # important steps below
      temp_file.close
      temp_file.unlink
    end
  end

  private

  def book_params
    params.require(:book).permit(current_user, :title)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
