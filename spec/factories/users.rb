FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)} 
    password_confirmation {password}
    family_name           {Gimei.name}
    first_name            {Gimei.name}
    family_name_kana      {Gimei.name.katakana}
    first_name_kana       {Gimei.name.katakana}
    birth_day             {"1990-01-01"}
  end
end
