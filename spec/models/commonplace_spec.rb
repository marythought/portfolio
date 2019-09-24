require 'rails_helper'

# app/models/commonplace.rb
RSpec.describe Commonplace, type: :model do
  it { should have_and_belong_to_many(:categories) }

  it 'is valid with valid attributes' do
    expect(Commonplace.new(quote: 'a cool thing I learned')).to be_valid
  end

  it 'is not valid without a quote' do
    expect(Commonplace.new).not_to be_valid
  end

  describe '#published' do
    before do
      FactoryBot.create(:commonplace)
      FactoryBot.create(:unpublished_commonplace)
    end

    it 'filters on published status' do
      expect(Commonplace.all.length).to eq(2)
      expect(Commonplace.published.length).to eq(1)
      expect(Commonplace.unpublished.length).to eq(1)
    end
  end

  describe 'categories' do
    let(:cp) { FactoryBot.create(:commonplace_with_category) }
    let(:uncategorized_cp) { FactoryBot.create(:commonplace) }

    it 'returns an array of category names if present' do
      expect(cp.category_names.length).to eq(1)
      expect(cp.category_names.first).to eq(Category.first.name)
      expect(uncategorized_cp.category_names).to eq([])
    end
  end
end
