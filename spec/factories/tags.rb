FactoryBot.define do
  factory :tag do
    tagname {Faker::Lorem.sentence}
  end
end
