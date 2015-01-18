require 'rails_helper'

feature 'User creates outfit', %Q{
  As an authenticated user
  I want to create outfit
  So that I can see how my bottoms and tops come together
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
