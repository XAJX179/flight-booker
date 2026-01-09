FactoryBot.define do
  factory :booking do
    flight
    verified { false }
  end
end
