FactoryBot.define do
  factory :user do
    name         { Faker::Name.name }
    email        { Faker::Internet.free_email }
    password     { 'hoge12' }
    password_confirmation { password }
    phone_number { Faker::Number.number(digits: 11) }
    birthday     { Faker::Date.backward }
  end
end
