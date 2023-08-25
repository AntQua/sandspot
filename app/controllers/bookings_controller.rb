class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pack = Pack.find(params[:pack_id])
    @booking.user = current_user


    if @booking.save
      redirect_to beaches_path, notice: "Booking was successfully created."
    else
      render "beaches/show", status: :unprocessable_entity
    end
  end
  private

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end