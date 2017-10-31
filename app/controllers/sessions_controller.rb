class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back, #{ @user.email }!"
      redirect_to root_url
    else
      flash[:alert] = "Sorry, an error was encountered while logging in!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out!"
    redirect_to root_url
  end
end
