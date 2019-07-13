class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all

  end

  def create
        # ストロングパラメーターを使用
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created.

"
    redirect_to book_path(book.id)
  else
    render("books")
  end

end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "Book was successfully updated."

    else
    render("books/:id/edit")
    end


  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path

    else
    render("books")
    end
  end








    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end