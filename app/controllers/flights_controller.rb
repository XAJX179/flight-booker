class FlightsController < ApplicationController
  def index
    if params_present?
      @flights = Flight.find_by_params(params)
    else
      @flight = Flight.new
    end
  end

  private

  def params_present?
    params.has_key?(:start_time) &&
    params.has_key?(:departure_airport) &&
    params.has_key?(:arrival_airport) &&
    params.has_key?(:no_of_passengers)
  end
end
