require 'rails_helper'

# app/models/project.rb
RSpec.describe Project, type: :model do
  it 'is valid with valid attributes' do
    expect(Project.new(name: 'my app')).to be_valid
  end

  it 'is not valid without a name' do
    expect(Project.new).not_to be_valid
  end

  describe 'attachments' do
    subject { create(:project).image }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
