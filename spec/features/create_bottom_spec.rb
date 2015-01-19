require 'rails_helper'

feature 'User adds a new bottom', %Q{
  As an authenticated user
  I want to add a new bottom
  So that i can use it in outfit
  } do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)
    end

    scenario 'with valid data' do

      visit '/clothings/new'
      select 'Bottom', from: 'Clothing type'
      select 'White', from: 'Color'
      select 'Any', from: 'Weather'
      attach_file "Image", File.join(Rails.root, "spec/support/images/example.jpg")
      click_button 'Create Clothing'

      expect(page).to have_content 'New clothing was successfully added!'
      expect(page).to have_content "White"
      expect(page).to have_css("img[src*='uploads']")

    end


    scenario 'with invalid data' do

      visit '/clothings/new'
      click_button 'Create Clothing'

      expect(page).to have_content "There were problems processing your order!"
      expect(page).to have_content "Clothing type can't be blank"
      expect(page).to have_content "Image can't be blank"
      expect(page).to have_content "Color can't be blank"

    end

  end
