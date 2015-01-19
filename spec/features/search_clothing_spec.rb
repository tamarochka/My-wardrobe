require 'rails_helper'

feature 'User searches for clothings', %Q{
  As an authorised user
  I want to find a list of my clothes
  So that I can pick clothing
  } do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)
    end

    scenario 'from the index page' do
      top = FactoryGirl.create(:clothing, user: @user)

      visit clothings_path
      fill_in "keywords", with: "top"
      click_on "Search"

      expect(page).to have_content top.clothing_style

    end

    scenario 'invalid search' do

      top = FactoryGirl.create(:clothing, user: @user)

      visit clothings_path
      fill_in "keywords", with: "kjlkhl"
      click_on "Search"

      expect(page).not_to have_content top.clothing_style

    end
  end
