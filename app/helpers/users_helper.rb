module UsersHelper

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to root_path # better yet new_user_session_path
    end
  end
end
