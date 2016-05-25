class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # sign_in user
      redirect_to @user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end



    # if @user.nil?
    #   render 'new'
    # end
    #
    # if @user.authenticate(params[:password])
    #   # add cookie stuff here
    #   redirect_to @user
    # else
    #   render 'new'
    # end
  end

  private
  def find_username
    @user = User.find_by(params[:username])
  end
end
