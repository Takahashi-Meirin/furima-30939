FactoryBot.define do
  factory :item do
    name             { Faker::Name.name }
    introduction     { Faker::Lorem.sentence }
    price            { '55555' }
    category_id      { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id    { 2 }
    shipping_day_id  { 2 }
    association :user

    # 生成するダミーデータに画像を添付する
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
