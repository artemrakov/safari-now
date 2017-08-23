class SafarisController < ApplicationController
  before_action :set_safari, only: [:show]

  def index
    if params[:title].present?
      @safaris = Safari.where(title: params[:title])
    else
      @safaris = Safari.all
    end
  end

   def show
    @safari = Safari.find(params[:id])
    @safari_coordinates = { lat: @safari.latitude, lng: @safari.longitude }
    @user = @safari.user
  end


  def new
    unless current_user
      redirect_to new_user_session_url
    end
    @safari = Safari.new
  end

  def create
    @safari = Safari.new(safari_params)
    @safari.user = current_user
    if @safari.save
      redirect_to safari_path(@safari)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def safari_params
    params.require(:safari).permit(:title, :address, :price, :description, :capacity, :date, :photos, :photos_cache)
  end

  def set_safari
    @safari = Safari.find(params[:id])
  end

end
