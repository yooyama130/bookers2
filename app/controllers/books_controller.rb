class BooksController < ApplicationController
  def index
    @user = current_user
    @new_book = Book.new
    @all_books = Book.all
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@new_book)
    else
      # new_bookをnewする以外の、必要なデータを改めて取得
      @user = current_user
      @all_books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def edit
    correct_user
    @book = Book.find(params[:id])
  end

  def update
    correct_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    book = Book.find(params[:id])
    user = book.user
    # 定義したuserと現在ログインしているuserが一致していなければ、一覧ページにリダイレクト。
    redirect_to(books_path) unless user == current_user
  end
end
