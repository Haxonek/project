class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def show
    @books = Book.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # doesn't ensure passwords match :/

    if @user.save
      flash[:notify] = "The user was created successfully"
      redirect_to user_path(@user)
    else
      flash[:failure] = "There was an error creating the user"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_hash, :password_digest, :description, :author_name, :books)
  end
end
