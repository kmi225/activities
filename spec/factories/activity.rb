FactoryBot.define do
  factory :todo do
    activity_id { Faker::Number.number(10) }
    name { Faker::Lorem.word }
    phone { Faker::Number.number(10)}
    address {Faker::Lorem.word }
    intro { Faker::Lorem.word }
    url { Faker::Lorem.word } 
  end
end