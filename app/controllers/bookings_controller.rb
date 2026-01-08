class BookingsController < ApplicationController
  def new
    if params_present?
      @no_of_passengers = bookings_params[:no_of_passengers]
      unless @no_of_passengers.to_i.between?(1, 4)
        flash[:alert] =  "Only till 4 passengers are allowed in a booking."
        redirect_to "/flights/index"
      end
      begin
        flight_id = bookings_params[:flight_id]
        @flight = Flight.find(flight_id)
      rescue ActiveRecord::RecordNotFound
        flash[:alert] =  "Invalid flight??? Try again."
        redirect_to "/flights/index"
      end
    else
      flash[:alert] = "Please select a flight!"
      redirect_to "/flights/index"
    end
  end

  def params_present?
    params.has_key?(:booking) &&
    params.dig(:booking, :flight_id) &&
    params.dig(:booking, :no_of_passengers)
  end

  def bookings_params
    params.expect(booking: [ :flight_id, :no_of_passengers ])
  end
end
