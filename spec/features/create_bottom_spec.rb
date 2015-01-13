require 'rails_helper'

feature 'User adds a new bottom', %Q{
  As an authenticated user
  I want to add a new bottom
  So that o can use it in outfits
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'with valid data' do

    bottom = FactoryGirl.build(:bottom)

    visit '/bottoms/new'
    select 'Shorts', from: 'Bottom type'
    select 'Blue', from: 'Color'
    attach_file "Pic", File.join(Rails.root, "spec/support/images/example.jpg")
    click_button 'Create Bottom'

    expect(page).to have_content 'New bottom successfully added'
    expect(page).to have_content bottom.bottom_type
    expect(page).to have_content bottom.color
    expect(page).to have_css("img[src*='uploads']")

  end


  scenario 'with invalid data' do

    visit '/bottoms/new'
    click_button 'Create Bottom'

    expect(page).to have_content "There were problems processing your order!"
    expect(page).to have_content "Bottom type can't be blank"
    expect(page).to have_content "Pic can't be blank"
    expect(page).to have_content "Color can't be blank"

  end

end
