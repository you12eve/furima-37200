FactoryBot.define do
  factory :purchase_delivery do
    post_address { '123-1234' }
    source_id    { Faker::Number.between(from: 2, to: 48) }
    municipality { '新宿区' }
    address      { '新宿1-1' }
    building     { '新宿ハイツ' }
    phone_number { '09000000000' }

    token { "tok_abcdefghijk00000000000000000" } 

  end
end
