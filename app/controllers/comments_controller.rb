class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :like, :dislike, :destroy]

  def show
    chapter_id = @comment.chapter_id
    @chapter = Chapter.find(chapter_id)
    book_id = @chapter.book_id
    redirect_to book_chapter_path(book_id, chapter_id)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.chapter_id = params[:comment][:chapter_id]
    @chapter = Chapter.find(params[:comment][:chapter_id])
    # add @comment.user_id = current_user.id
    @comment.user_id = 0

    if @comment.save
      redirect_to book_chapter_path(@chapter.book_id, @chapter)
    else
      # This doesn't feel right.....
      redirect_to book_chapter_path(@chapter.book_id, @chapter)
    end
  end

  def like
    @comment.increment(:rating)
    if @comment.save
      redirect_to comment_path
    else
      # flash[:error]
      redirect_to comment_path
    end
  end

  def dislike
    @comment.decrement(:rating)
    @comment.save
    if Integer(@comment.rating) < -3
      @comment.destroy
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :chapter_id)
  end

  def destroy
    @chapter = Chapter.find(params[:chapter_id])
    @comment.destroy
    redirect_to @chapter
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
