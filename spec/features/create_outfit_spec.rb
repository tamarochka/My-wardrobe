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

    expect(page).to have_content 'Blue Sweater'
    expect(page).to have_content "Blue Jeans"

    click_on "Save"

    expect(Outfit.count).to eq 1

  end


  scenario 'no tops availble' do

    bottom = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)
    top = FactoryGirl.create(:clothing, clothing_type: "Bottom", clothing_style: "Jeans", user: @user)

    visit '/outfits/new'

    expect(page).to have_content "Time to clean your laundry?"
    expect(page).to have_content "Blue Jeans"

  end

  scenario 'no bottoms availble' do

    bottom = FactoryGirl.create(:clothing)
    top = FactoryGirl.create(:clothing)

    visit '/outfits/new'

    expect(page).to have_content "Time to clean your laundry?"
    expect(page).to have_content 'Blue Sweater'

  end
end
