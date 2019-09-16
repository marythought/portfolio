# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w[tech kids food religion finance fashion]
random_num_array = [0, 1, 2, 3]

categories.each do |cat|
  Category.where(
    name: cat
  ).first_or_create!
end

Commonplace.destroy_all

20.times do
  cp = Commonplace.create!(
    source: Faker::Name.name,
    notes: Faker::Lorem.paragraph,
    published_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
    quote: Faker::Lorem.paragraph,
    url: Faker::Internet.url
  )

  random_num_array.sample.times do
    cp.categories << Category.where(name: categories.sample)
  end
end

# and some unpublished (pending)
20.times do
  cp = Commonplace.create!(
    source: Faker::Name.name,
    notes: Faker::Lorem.paragraph,
    quote: Faker::Lorem.paragraph,
    url: Faker::Internet.url
  )

  random_num_array.sample.times do
    cp.categories << Category.where(name: categories.sample)
  end
end

Project.destroy_all

10.times do
  # TODO: add an image
  Project.where(
    name: 'My cool tech project',
    technologies_used: '',
    description: Faker::Lorem.paragraph,
    github: 'http://www.github/com/',
    url: Faker::Internet.url,
    writeup: Faker::Internet.url,
    created_at: Time.now,
    image_url: 'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg'
  ).first_or_create!
end
