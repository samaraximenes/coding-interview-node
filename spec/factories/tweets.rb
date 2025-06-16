FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.paragraph }
    association :user
  end
end
