class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:session][:username], params[:session][:password])
    if user.nil?
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    else
      sign_in!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy

  end

end
