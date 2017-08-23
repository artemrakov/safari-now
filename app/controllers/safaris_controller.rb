class SafarisController < ApplicationController
  before_action :set_safari, only: [:show]

  def index
    if params[:search].present?
      @safaris = Safari.where(title: params[:search])
    else
      @safaris = Safari.where.not(latitude: nil, longitude: nil)
    end
    @hash = Gmaps4rails.build_markers(@safaris) do |safari, marker|
      marker.lat safari.latitude
      marker.lng safari.longitude
      # marker.infowindow render_to_string(partial: "/safaris/map_box", locals: { safari: safari })
    end
  end

   def show
    @safari = Safari.find(params[:id])
    @safari_coordinates = { lat: @safari.latitude, lng: @safari.longitude }
    @user = @safari.user
  end


  def new
    @safari = Safari.new()
  end

  def create
    @safari = Safari.new(safari_params)
    @safari.user = current_user
    if @safari.save
      redirect_to safari_path
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
    params.require(:safari).permit(:title, :location, :price, :description, :capacity, :date, {photos: []})
  end

  def set_safari
    @safari = Safari.find(params[:id])
  end

end
