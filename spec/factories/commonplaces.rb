FactoryBot.define do
  factory :commonplace do
    author { Faker::Lorem.name }
    notes { Faker::Lorem.paragraph }
    published_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    quote { Faker::Lorem.paragraph }
    url { Faker::Internet.url }
  end
end
