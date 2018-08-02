class UsersController < ApplicationController
  include SessionsHelper

  def new
  end

  # rendering the errors if they exist and redirecting towards homepage
  def create
    user = User.create(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.errors.any?
      @errors = user.errors.messages
      flash[:danger] = "User wasn't created"
      render :new
    else
      log_in(user)
      redirect_to root_path, flash: { success: "User was successfully created" }
    end
  end

  # making it possible to type in a username in the URL, only for the connected user
  def show
    check_user
  end

  # destroy a user
  def destroy
    current_user.destroy
    flash[:success] = "User successfully deleted"
    redirect_to root_path
  end

  # update a user pwd
  def update
    check_user
    user = current_user
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save && params[:password].length >= 5
      flash[:success] = "Password updated"
      redirect_to root_path
    else
      flash[:danger] = "Password wasn't updated"
      render :edit
    end
  end

  def edit
    check_user
  end
end
