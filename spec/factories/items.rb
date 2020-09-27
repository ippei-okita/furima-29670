FactoryBot.define do
  factory :item do
    name                { Faker::String.random(length: 40) }
    description         { Faker::String.random(length: 1000) }
    category_id         { 2 }
    condition_id        { 2 }
    shipping_id         { 2 }
    prefecture_id       { 2 }
    day_id              { 2 }
    price               { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
