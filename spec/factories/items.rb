FactoryBot.define do
  factory :item do
    title {Faker::Name.name}
    discription { Faker::Lorem.sentence }
    price { 6000 }
    category_id { Faker::Number.between(from:2, to: 11) }
    condition_id { Faker::Number.between(from:2, to: 7) }
    charge_id { Faker::Number.between(from:2, to: 3) }
    source_id { Faker::Number.between(from:2, to: 48) }
    scheduled_day_id { Faker::Number.between(from:2, to: 4) }

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end