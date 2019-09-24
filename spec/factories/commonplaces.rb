FactoryBot.define do
  factory :commonplace do
    source { Faker::Name.name }
    notes { Faker::Lorem.paragraph }
    published_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    quote { Faker::Lorem.paragraph }
    url { Faker::Internet.url }
  end

  factory :unpublished_commonplace, parent: :commonplace do
    published_at { nil }
  end

  factory :commonplace_with_category, parent: :commonplace do
    after(:create) do |cp|
      cp.categories << FactoryBot.build(:category)
    end
  end
end
