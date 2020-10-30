FactoryBot.define do
  factory :buy do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building {}
    phone_number { '09067891243' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
