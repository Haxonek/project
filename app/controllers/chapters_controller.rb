class ChaptersController < ApplicationController
  before_action :find_chapter, only: [:show, :edit, :update, :destroy]

  def index
    # @book = Book.find(params[:book_id])
    @chapters = Chapter.where(book_id: @book).order("created_at DESC")
  end

  def show
    @book = Book.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new
  end

  def create
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new(chapter_params)
    @book.increment(:num_chapters)
    @chapter.book_id = @book.id
    @book.tags = @book.tags.to_s + ", " + @chapter.tags.to_s

    # I don't like this :/ it seems like it may fail....
    if @chapter.save && @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    book_id = @chapter.book_id
    @book = Book.find(params[:book_id])
    @chapter.destroy
    # check for errors
    if @book.num_chapters > 0
      @book.decrement(:num_chapters).save
    end
    redirect_to book_path(book_id)
  end

  private
  def find_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :book_id, :description, :body, :tags)
  end
end
