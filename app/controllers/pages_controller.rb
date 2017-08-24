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
    @booking = Booking.new
    @safari = Safari.find(params[:safari_id])
    @user = User.find(params[:id])
    @booking.safari = @safari
    @booking.user = @user
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to new_user_registration_path
    end
  end

  def cancel_booking
    @safari = Safari.find(params[:safari_id])
    @user = User.find(params[:id])
    @booking = Booking.where(safari_id: @safari.id, user_id: @user.id).first
    @booking.status = "decline"
    @booking.save
    redirect_to :dashboard
  end

  def accept_booking
    @safari = Safari.find(params[:safari_id])
    @user = User.find(params[:id])
    @booking = Booking.where(safari_id: @safari.id, user_id: @user.id).first
    @booking.status = "accept"
    @booking.save
    redirect_to :dashboard
  end
end
