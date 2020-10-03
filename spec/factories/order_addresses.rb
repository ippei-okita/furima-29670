FactoryBot.define do
  factory :order_address do
    postal_code            { '123-4567' }
    prefecture_id          { Faker::Number.within(range: 2..48) }
    city                   { Faker::Address.street_name }
    address                { Faker::Address.street_address }
    building               { Faker::Address.building_number }
    phone_num              { Faker::Number.number(digits: 11) }
    token                  { Faker::Lorem.characters }
  end
end
