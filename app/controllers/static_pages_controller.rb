class StaticPagesController < ApplicationController
  include SessionsHelper

  def secret
    if !logged_in?
      flash[:danger] = "Please connect to gain access to the secret page"
      redirect_to login_path
    end
  end
end
