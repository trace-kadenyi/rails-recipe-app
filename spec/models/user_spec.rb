require 'rails_helper'

RSpec.describe User, type: :model do
  # test associations
  describe 'associations' do
    it 'has many recipes' do
      association = described_class.reflect_on_association(:recipes)
      expect(association.macro).to eq :has_many
    end

    it 'has many foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq :has_many
    end
  end

  # test validations

  describe 'validations' do
    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end
  end
end
