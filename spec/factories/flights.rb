FactoryBot.define do
  factory :flight do
    sequence(:duration) { |n| "PT2H30M#{n}S" }
    sequence(:start_time) { |n| "2025-12-#{n} 21:29:00" }

    departure_airport factory: :airport
    arrival_airport factory: :airport
  end
end
