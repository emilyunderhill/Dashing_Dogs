class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def index
    @outfit = Outfit.find(params[:outfit_id])
    @bookings = Booking.where(outfit_id: params[:outfit_id])
  end
end
