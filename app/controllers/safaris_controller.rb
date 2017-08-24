class SafarisController < ApplicationController
  before_action :set_safari, only: [:show]

  def index
    if params[:search].present?
      # @safaris = Safari.where('title LIKE ?', params[:search])
      @safaris = Safari.where("lower(title) LIKE ? OR lower(address) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
      if @safaris == []
        @safaris = Safari.where.not(latitude: nil, longitude: nil)
      end
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
    unless current_user
      redirect_to new_user_session_url
    end
    @safari = Safari.new
    @safari_images = @safari.safari_images.build
  end

  def create
    @safari = Safari.new(safari_params)
    @safari.user = current_user
    if @safari.save
      params[:safari_images]['photo'].each do |p|
        @safari.safari_images.create!(photo: p)
      end
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
    params.require(:safari).permit(:title, :address, :price, :description, :capacity, :date, safari_images: [:id, :safari_id, :photo])
  end

  def set_safari
    @safari = Safari.find(params[:id])
  end

end
