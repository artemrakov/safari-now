class ReviewsController < ApplicationController
  before_action :set_safari, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.safari = @safari
    @review.booking = current_user.bookings.where(safari: @safari).first
    if @review.save
      redirect_to safari_path(@safari)
    else
      render 'safaris/show'
    end
  end

  private

  def set_safari
    @safari = Safari.find(params[:safari_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
