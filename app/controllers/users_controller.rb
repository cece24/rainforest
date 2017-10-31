class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      email:    params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )

    if @user.save
      flash[:notice] = "Your account has been successfully created!"
      redirect_to root_url
    else
      flash[:alert] = "Sorry, an error was encountered while creating your account!"
      render :new
    end
  end
end
