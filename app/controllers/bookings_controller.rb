class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def index
    @outfit = Outfit.find(params[:outfit_id])
    @bookings = Booking.where(outfit_id: params[:outfit_id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end
end
