FactoryBot.define do
  factory :passenger do
    booking
    sequence(:name) { |n| "passenger #{n}" }
    sequence(:email) { |n| "email #{n}" }
  end
end
