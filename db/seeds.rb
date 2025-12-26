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
].each do |airport|
  Airport.find_or_create_by!(name: airport[:name], code: airport[:code])
end if Rails.env.development?
