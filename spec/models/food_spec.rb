require 'rails_helper'

RSpec.describe Food, type: :model do
  # test associations
  describe 'associations' do
    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq :has_many
    end

    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  # test validations
  describe 'validations' do
    it 'is not valid without a name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end

    it 'name should not be longer than 70 characters' do
      food = Food.new(name: 'a' * 16)
      expect(food).to_not be_valid
    end

    it 'is not valid without a user_id' do
      food = Food.new(user_id: nil)
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      food = Food.new(measurement_unit: nil)
      expect(food).to_not be_valid
    end

    it 'should have a number for measurement_unit' do
      food = Food.new(measurement_unit: 'a')
      expect(food).to_not be_valid
    end

    it 'is not valid without a price' do
      food = Food.new(price: nil)
      expect(food).to_not be_valid
    end

    it 'should be a number(price)' do
      food = Food.new(price: 'a')
      expect(food).to_not be_valid
    end
  end
end
