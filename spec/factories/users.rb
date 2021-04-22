FactoryBot.define do
  factory :user do
    name         { Faker::Name.name }
    email        { Faker::Internet.free_email }
    password     { 'hoge12' }
    password_confirmation { password }
  end
end
