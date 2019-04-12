class SessionsController < ApplicationController

  def new #login page
    render :new
  end

  def create #login button
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    # remember these should be symbols!
    # they give us the params in the form of email, pw
    # we find in db

    if user #exist in db?
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["invalid username or password"]
      render :new
    end

  end

  def destroy #logout button
    logout
    redirect_to new_session_url
  end

end
