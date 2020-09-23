FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 1)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"大北"}
    first_name            {"一平"}
    family_kana           {"オオキタ"}
    first_kana            {"イッペイ"}
    birth_day             {"1985-04-12"}
  end
end