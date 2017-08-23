class PagesController < ApplicationController
  def home
  end

  def dashboard
    if user_signed_in?
      @user = current_user
      @user_bookings = @user.bookings
    else
      redirect_to :safaris
    end
  end

  def create_booking

  end

end
