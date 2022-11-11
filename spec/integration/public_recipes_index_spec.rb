require 'rails_helper'

RSpec.describe 'PublicRecipes Index', type: :feature do
  before(:each) do
    @recipe = Recipe.create(
      name: 'Chicken',
      preparation_time: 30,
      cooking_time: 60,
      description: 'Chicken is good',
      public: true
    )
  end

  describe 'GET /public_recipes' do
    it 'displays the contents of the page' do
      visit public_recipes_path
      expect(page).to have_content 'Public Recipes'
    end

    it 'displays the contents of the page' do
      visit public_recipes_path
      expect(page).to have_content 'COOK BOOK'
    end

    it 'displays the contents of the page' do
      visit public_recipes_path
      expect(page).to have_content 'Log In'
    end

    it 'displays the contents of the page' do
      visit public_recipes_path
      expect(page).to have_content 'Sign Up'
    end
  end
end

# @recipe.update(public: false)
# visit public_recipes_path
# expect(page).to have_content 'Public Recipes'
# expect(page).to have_no_content 'Chicken'

# @recipe.update(public: true)
# visit public_recipes_path
# expect(page).to have_content 'Public Recipes'
# expect(page).to have_content 'Chicken'

# @recipe.destroy
# visit public_recipes_path
# expect(page).to have_content 'Public Recipes'
# expect(page).to have_no_content 'Chicken'
