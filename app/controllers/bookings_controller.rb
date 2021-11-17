class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def index
    @outfit = Outfit.find(params[:outfit_id])
    @bookings = @outfit.bookings
  end
end
