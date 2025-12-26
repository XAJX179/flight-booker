FactoryBot.define do
  factory :airport do
    sequence(:name) { |n| "Airport name #{n}" }
    sequence(:code) { |n| "ID#{n}" }
  end
end
