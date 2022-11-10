require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  # test associations
  describe 'associations' do
    it 'belongs to recipe' do
      association = described_class.reflect_on_association(:recipe)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to food' do
      association = described_class.reflect_on_association(:food)
      expect(association.macro).to eq :belongs_to
    end
  end

  # test validations
  describe 'validations' do
    it 'is not valid without a quantity' do
      recipe_food = RecipeFood.new(quantity: nil)
      expect(recipe_food).to_not be_valid
    end

    it 'should be a number' do
      recipe_food = RecipeFood.new(quantity: 'a')
      expect(recipe_food).to_not be_valid
    end

    it 'should be greater than 0' do
      recipe_food = RecipeFood.new(quantity: 0)
      expect(recipe_food).to_not be_valid
    end
  end

  # test functionality
  describe 'functionality' do
    it 'should return the quantity of the food' do
      recipe_food = RecipeFood.new(quantity: 2)
      expect(recipe_food.quantity).to eq 2
    end
  end
end
