class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.where("tags LIKE ?", '%'+params[:search]+'%').order(created_at: :desc) # contains(tags: params[:search]) # where(:tags =~ str) # .search(params[:search])

    if @books.nil?
      @books = Book.all
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :chapters, :tags, :user_id, :complete)
  end
end
