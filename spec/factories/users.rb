FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { "111111Zz" }
    password_confirmation{ password }
    last_name { "田中" }
    last_kana { "タナカ" }
    first_name { "太郎" }
    first_kana { "タロウ" }
    birthday {Faker::Date.birthday}
  end
end