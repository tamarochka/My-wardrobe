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

    expect(page).to have_content 'Blue Sweater'
    expect(page).to have_content "Blue Jeans"

    click_on "Create Outfit"

    click_on "Delete"

    expect(page).to have_content "Outfit deleted"

  end
end
