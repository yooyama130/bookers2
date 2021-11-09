class BooksController < ApplicationController
  def index
    @user = current_user
    @new_book = Book.new
    @all_books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
