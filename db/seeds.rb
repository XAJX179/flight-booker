# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[
  { name: 'Los Angeles International Airport', code: 'LAX' },
  { name: 'John F. Kennedy International Airport', code: 'JFK' },
  { name: 'Chicago O\'Hare International Airport', code: 'ORD' },
  { name: 'San Francisco International Airport', code: 'SFO' },
  { name: 'Dallas/Fort Worth International Airport', code: 'DFW' },
  { name: 'Denver International Airport', code: 'DEN' },
  { name: 'Heathrow Airport', code: 'LHR' },
  { name: 'Paris Charles de Gaulle Airport', code: 'CDG' },
  { name: 'Tokyo Haneda Airport', code: 'HND' },
  { name: 'Dubai International Airport', code: 'DXB' }
].each do |attr|
  Airport.find_or_create_by!(name: attr[:name], code: attr[:code])
end if Rails.env.development?

if Rails.env.development?
  first_id = Airport.first.id
  last_id = Airport.last.id

  data = []

  10.times do |n|
    data << { start_time: "2025-12-27 18:23:02.263913", duration: "PT2H30M0S", departure_airport: first_id+n, arrival_airport: last_id-n }
  end

  data.each do |attr|
    Flight.find_or_create_by!(start_time: attr[:start_time],
                              duration: attr[:duration],
                              departure_airport_id: attr[:departure_airport],
                              arrival_airport_id: attr[:arrival_airport])
  end
end
