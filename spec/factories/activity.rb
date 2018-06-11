FactoryBot.define do
  factory :activity do
    name { Faker::Lorem.word }
    phone { Faker::Number.number(10)}
    address {Faker::Lorem.word }
    intro { Faker::Lorem.word }
    url { Faker::Lorem.word } 
  end
end