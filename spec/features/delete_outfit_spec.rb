require 'rails_helper'

feature 'User deletes outfit', %Q{
  As an authenticated user
  I want to delete outfit
  So that it's not shown in my worn outfits
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'with valid data' do

    bottom = FactoryGirl.create(:clothing)
    top = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans")

    visit '/outfits/new'

    expect(page).to have_content 'Blue Top Sweater'
    expect(page).to have_content "Blue Bottom Jeans"

    click_on "Create Outfit"

    click_on "Delete"

    expect(page).to have_content "Outfit deleted"

  end


  # scenario 'with invalid data' do
  #
  #   visit '/outfits/new'
  #   click_button 'Create Bottom'
  #
  #   expect(page).to have_content "There were problems processing your order!"
  #   expect(page).to have_content "Bottom type can't be blank"
  #   expect(page).to have_content "Pic can't be blank"
  #   expect(page).to have_content "Color can't be blank"
  #
  # end

end
