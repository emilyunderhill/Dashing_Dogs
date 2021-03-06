class BookingsController < ApplicationController
  before_action :set_outfit, only: %i[new create index]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.outfit = @outfit
    @booking.user = current_user
    if @booking.save
      flash[:notice] = "Your booking request has been sent"
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def index
    @bookings = @outfit.bookings
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy!
    redirect_to outfit_path(@booking.outfit), alert: "Booking cancelled"
  end

  def approve
    @booking = Booking.find(params[:outfit_id])
    @booking.approve = true
    @booking.save
    redirect_to outfit_path(@booking.outfit), notice: "Booking approved"
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end
end
