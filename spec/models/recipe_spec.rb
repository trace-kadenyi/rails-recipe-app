require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # test associations
  describe 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
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
      recipe = Recipe.new(name: nil)
      expect(recipe).to_not be_valid
    end

    it 'name should not be longer than 70 characters' do
      recipe = Recipe.new(name: 'a' * 71)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a user_id' do
      recipe = Recipe.new(user_id: nil)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      recipe = Recipe.new(description: nil)
      expect(recipe).to_not be_valid
    end
    

    it 'is not valid without a preparation_time' do
      recipe = Recipe.new(preparation_time: nil)
      expect(recipe).to_not be_valid
    end

    it 'should be a number' do
      recipe = Recipe.new(preparation_time: 'a')
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a cooking_time' do
      recipe = Recipe.new(cooking_time: nil)
      expect(recipe).to_not be_valid
    end

    it 'should be a number' do
      recipe = Recipe.new(cooking_time: 'a')
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a public' do
      recipe = Recipe.new(public: nil)
      expect(recipe).to_not be_valid
    end
  end


end