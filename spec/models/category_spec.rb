require 'rails_helper'

# app/models/category.rb
RSpec.describe Category, type: :model do
  it { should have_and_belong_to_many(:commonplaces) }
end
