FactoryBot.define do
  factory :tweet do
    task            { Faker::Lorem.sentence }
    category_id     { 2 + Faker::Number.digit }
    start_hour_id   { 2 + Faker::Number.digit }
    start_minute_id { 2 + Faker::Number.digit }
    end_hour_id     { 2 + Faker::Number.digit }
    end_minute_id   { 2 + Faker::Number.digit }
    detalis         { Faker::Lorem.sentence }
    association :user
  end
end
