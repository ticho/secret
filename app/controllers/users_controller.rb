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
      flash[:danger] = "User wasn't created"
      render :new
    else
      log_in(user)
      redirect_to root_path, flash: { success: "User was successfully created" }
    end
  end

  # making it possible to type in a username in the URL, only for the connected user
  def show
    if (!logged_in? || current_user.id.to_i != params[:id].to_i)
      flash[:danger] = "You don't have access rights to this user's page"
      redirect_to root_path
    end
  end

  def destroy
    current_user.destroy
    flash[:success] = "User successfully deleted"
    redirect_to root_path
  end

  def update
    user = current_user
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save
      flash[:success] = "Password updated"
      redirect_to root_path
    else
      flash[:danger] = "Password wasn't updated"
      render :edit
    end
  end

  def edit
  end
end
