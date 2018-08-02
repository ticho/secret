class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # login
      log_in(user)
      flash[:success] = "Login successful"
      redirect_to root_path
    else
      # show error
      flash[:danger] = "Login unsuccessful"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "Logout successful"
    redirect_to root_path
  end
end
