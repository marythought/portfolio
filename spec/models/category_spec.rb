require 'rails_helper'

# app/models/category.rb
RSpec.describe Category, type: :model do
  it { should have_and_belong_to_many(:commonplaces) }

  it 'is valid with valid attributes' do
    expect(Category.new(name: 'tech')).to be_valid
  end

  it 'is not valid without a name' do
    expect(Category.new).not_to be_valid
  end

  it 'is not valid with a duplicate name' do
    Category.create(name: 'tech')
    expect(Category.new(name: 'tech')).not_to be_valid
    expect(Category.new(name: 'TECH')).not_to be_valid
  end
end
