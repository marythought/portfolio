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

    it 'returns a string with semi-colon separated category names if present' do
      expect(cp.category_names).to eq(cp.categories.first.name)
      expect(cp.category_names.split(';').length).to eq(1)
      expect(cp.category_names.split(';').first).to eq(Category.first.name)
      expect(uncategorized_cp.category_names).to eq('')
    end
  end

  describe '#add_category' do
    let(:cp) { FactoryBot.create(:commonplace_with_category) }
    let(:name) { 'category' }

    subject { cp.add_category(name) }

    context 'when category does not exist' do
      let(:name) { 'new category' }
      it 'adds the category' do
        expect(subject.name).to eq(name)
        expect(cp.categories.length).to eq(2)
      end
    end

    context 'when category already exists' do
      let(:name) { cp.categories.first.name }

      it 'does not add category' do
        expect(subject.name).to eq(name)
        expect(cp.categories.length).to eq(1)
      end
    end

    context 'when category exists with different case structure' do
      let(:name) { cp.category_names.upcase }

      it 'finds and uses the existing category' do
        expect(subject.name).to_not eq(name)
        expect(subject.name).to eq(name.downcase)
        expect(cp.categories.length).to eq(1)
      end
    end

    context 'when name is empty' do
      let(:name) { '' }
      it 'does not adds the category' do
        expect(subject).to eq(nil)
      end
    end
  end
end
