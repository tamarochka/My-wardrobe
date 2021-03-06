require 'rails_helper'

feature 'User mark clothes as clean', %Q{
  As an authenticated user
  I want to change clothing condition to clean
  So that i can use it in an outfit
  } do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)
    end

    scenario 'clothing used in outfit shows up in laundry' do

      bottom = FactoryGirl.create(:clothing, clothing_type: "Top", clothing_style: "Sweater", user: @user)
      top = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)
      Outfit.create(top: top, bottom: bottom)

      visit '/laundry'

      expect(page).to have_content top.clothing_style
      expect(page).to have_content bottom.clothing_style

    end


    scenario 'empty laundry bag' do

      bottom = FactoryGirl.create(:clothing, clothing_type: "Top", clothing_style: "Sweater", user: @user)
      top = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)

      visit '/laundry'

      expect(page).not_to have_content top.clothing_style
      expect(page).not_to have_content bottom.clothing_style
      expect(page).to have_content "There are no clothing in you laundry bag"

    end

  end
