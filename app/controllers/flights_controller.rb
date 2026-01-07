class FlightsController < ApplicationController
  def index
    if params_present?
      @flights = Flight.find_by_params(flights_params)
      @no_of_passengers = flights_params[:no_of_passengers]
    end
  end

  private

  def params_present?
    params.has_key?(:flight) &&
    params.dig(:flight, :departure_airport) &&
    params.dig(:flight, :arrival_airport) &&
    params.dig(:flight, :start_time) &&
    params.dig(:flight, :no_of_passengers)
  end

  def flights_params
    params.expect(flight:
                  [ :start_time,
                    :departure_airport,
                    :arrival_airport,
                    :no_of_passengers ])
  end
end
