FactoryBot.define do
  factory :project do
    name { 'My cool app' }
    after(:build) do |project|
      project.image.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'files', 'rafi.jpeg')),
        filename: 'rafi.jpeg', content_type: 'image/jpeg'
      )
    end
  end
end
