FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@test.com"}
    password              {"123abc"}
    password_confirmation {"123abc"}
    family_name           {"苗字"}
    first_name            {"名前"}
    family_name_kana      {"みょうじ"}
    first_name_kana       {"なまえ"}
    birth_day             {"1990-01-01"}
  end
end
