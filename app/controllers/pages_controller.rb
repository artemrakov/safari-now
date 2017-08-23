class PagesController < ApplicationController
  def home
  end

  def dashboard
    if user_signed_in?
      @user = current_user
    else
      redirect_to :safaris
    end
  end

end
