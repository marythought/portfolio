require 'rails_helper'

# app/models/commonplace.rb
RSpec.describe Commonplace, type: :model do
  it { should have_and_belong_to_many(:categories) }
end
