class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  attribute :duration, :duration

  def self.find_by_params(params)
    where(departure_airport: params[:departure_airport],
          arrival_airport: params[:arrival_airport])
    .filter { |f| f.start_time.to_date == params[:start_time].to_date }
  end
end
