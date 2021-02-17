FactoryBot.define do
  factory :order do
    post_code     { '123-4567' }
    municipality  { '例市例区' }
    address       { '例番地' }
    building      { '例マンション' }
    phone_number  { '09012345678' }
    prefecture_id { 2 }
    # token         {''}
  end
end