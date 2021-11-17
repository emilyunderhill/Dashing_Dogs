class BookingsController < ApplicationController
  before_action :set_outfit, only: [:new, :create, :index]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.outfit = @outfit
    @booking.user = @outfit.user
    if @booking.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(outfit_id: params[:outfit_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end
end
