class Airport < ApplicationRecord
  has_many :departing_flights, dependent: :destroy, class_name: "Flight", foreign_key: "departure_airport_id"
  has_many :arriving_flights, dependent: :destroy, class_name: "Flight", foreign_key: "departure_airport_id"

  validates_uniqueness_of :code
  validates_length_of :code, is: 3
  validates_length_of :name, minimum: 10
end
