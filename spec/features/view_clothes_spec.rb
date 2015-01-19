require 'rails_helper'

feature 'User views all availbale clothes', %Q{
  As an authenticated user
  I want to view a list of clothes
  So that I can use it for outfits
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'from index page' do

    top = FactoryGirl.create(:clothing, user: @user)
    bottom = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)

    visit '/clothings'

    expect(page).to have_content top.clothing_style
    expect(page).to have_content bottom.clothing_style

  end

  scenario 'from show page' do

    top = FactoryGirl.create(:clothing, user: @user)

    visit "/clothings/#{top.id}"

    expect(page).to have_content top.clothing_style
    expect(page).to have_content top.color

  end

end
