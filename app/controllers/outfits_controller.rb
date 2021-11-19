class OutfitsController < ApplicationController
  before_action :set_outfit, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @bookings = Booking.where(outfit_id: @outfit.id)
    @your_bookings = @bookings.select do |booking|
      booking.user == current_user
    end
  end

  def index
    if params[:query].present?
      @outfits = Outfit.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @outfits = Outfit.all
    end
  end

  def edit; end

  def update
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit)
    else
      render :edit
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy!
    redirect_to '/outfits', :notice => "The outfit: #{@outfit.name} has been deleted"
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :size, :price, :max_loan_period, :description, photos: [])
  end

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

end
