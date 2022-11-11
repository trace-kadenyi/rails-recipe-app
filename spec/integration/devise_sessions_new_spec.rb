require 'rails_helper'

RSpec.describe 'Sessions New', type: :feature do
  describe 'GET /users/sign_in' do
    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Log In'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Email'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Password'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Remember me'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_button('Create User')
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Sign up'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_link 'Sign Up'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_link 'COOK BOOK'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_link 'Public Recipes'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Forgot your password?'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content "Didn't receive confirmation instructions?"
    end
  end

  describe 'Sign in a user' do
    before(:each) do
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'mamoa@gmail.com'
        fill_in 'Password', with: 'qwerty'
      end

      # log into the app
      click_button 'Create User'
      expect(page).to have_link 'Logout'
      expect(page).to have_link 'COOK BOOK'
      expect(page).to have_link 'Home'
      expect(page).to have_link 'Foods'
      expect(page).to have_link 'Recipes'
      expect(page).to have_link 'Public Recipes'
      expect(page).to have_content 'Public Recipes'

      # click food link

      click_link 'Foods'
      expect(page).to have_content 'Food'
      expect(page).to have_content 'Measurement Unit'
      expect(page).to have_content 'Unit Price'
      expect(page).to have_content 'Quantity'
      expect(page).to have_content 'Actions'
      expect(page).to have_button('Add Food')

      # click add food button

      click_button 'Add Food'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Measurement Unit'
      expect(page).to have_content 'Unit Price'
      expect(page).to have_content 'Quantity'
      expect(page).to have_button('Create Food')

      # fill in food form

      within 'form' do
        fill_in 'Name', with: 'Goat meat'
        fill_in 'Measurement Unit', with: 'kg'
        fill_in 'Unit Price', with: '200'
        fill_in 'Quantity', with: '12'
      end

      # click create food button

      click_button 'Create Food'
      expect(page).to have_content 'Food was successfully created.'
      expect(page).to have_content 'Goat meat'
      expect(page).to have_content 'kg'
      expect(page).to have_content '200'
      expect(page).to have_content '12'
      pect(page).to have_button('Delete')

      # click delete button

      click_button 'Delete'
      expect(page).to have_content 'Food was successfully deleted.'

      # click recipe link

      click_link 'Recipes'
      expect(page).to have_content 'Recipes'
      pect(page).to have_button('Add Recipe')

      # click add recipe button

      click_button 'Add Recipe'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Description'
      expect(page).to have_content 'Preparation Time'
      expect(page).to have_content 'Cooking Time'
      expect(page).to have_checkbox('Public')

      # fill in recipe form

      within 'form' do
        fill_in 'Name', with: 'Goat meat stew'
        fill_in 'Description', with: 'Delicious goat meat stew'
        fill_in 'Preparation Time', with: '30'
        fill_in 'Cooking Time', with: '30'
        fill_in 'Public' do
          check 'Public'
        end
      end

      # click create recipe button

      click_button 'Create Recipe'
      expect(page).to have_link 'Goat meat stew'
      expect(page).to have_content 'Delicious goat meat stew'
      expect(page).to have_button('REMOVE')

      # click link to recipe

      click_link 'Goat meat stew'
      expect(page).to have_content 'Goat meat stew'
      expect(page).to have_content 'Delicious goat meat stew'
      expect(page).to have_content 'Preparation Time'
      expect(page).to have_content 'Cooking Time'
      expect(page).to have_content 'Public'
      expect(page).to have_button 'Generate Shopping List'
      expect(page).to have_button 'Add Ingredient'
      expect(page).to have_button 'Food'
      expect(page).to have_button 'Quantity'
      expect(page).to have_button 'Value'
      expect(page).to have_button 'Actions'

      # click add ingredient button

      click_button 'Add Ingredient'
      expect(page).to have_content 'Food'
      expect(page).to have_content 'Quantity'
      expect(page).to have_button 'Create Recipe Food'

      # go to public recipes

      click_link 'Public Recipes'
      expect(page).to have_content 'Public Recipes'
      expect(page).to have_link 'Goat meat stew'
    end
  end
end
