class UsersController < ApplicationController

  def new #sign up page
    @user = User.new
    render :new
  end

  # to access old values as pre-selected/defaults in an edit form (if we are using a partial)

  def create #sign up button
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show #shows user profile
    @user = User.find(params[:id]) #fetch user id from url(params)
    #remember not to use find_by here
    # can't use user_params here because they didn't fill out a form
    render :show #uses @user to make the view customized to that logged in user (or not logged in)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
    #require a top level key of user, allow us to access email and pw within it.
  end

end
