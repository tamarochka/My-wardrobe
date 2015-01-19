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

    click_on "Create Outfit"

    expect(Outfit.count).to eq 1

  end


  scenario 'no tops availble' do

    bottom = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)
    top = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)

    visit '/outfits/new'

    expect(page).to have_content 'No clean tops available.'
    expect(page).to have_content "Blue Bottom Jeans"

  end

  scenario 'no bottoms availble' do

    bottom = FactoryGirl.create(:clothing)
    top = FactoryGirl.create(:clothing)

    visit '/outfits/new'

    expect(page).to have_content 'No clean bottoms available.'
    expect(page).to have_content 'Blue Top Sweater'

  end
end
