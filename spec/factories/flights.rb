FactoryBot.define do
  factory :flight do
    sequence(:duration) { |n| "#{n}:00:00" }
    sequence(:start_time) { |n| "2025-12-#{n} 21:29:00" }

    departure_airport factory: :airport
    arrival_airport factory: :airport
  end
end
