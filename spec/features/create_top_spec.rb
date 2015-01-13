require 'rails_helper'

feature 'User adds a new top', %Q{
  As an authenticated user
  I want to add a new top
  So that i can use it in outfit
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'with valid data' do

    top = FactoryGirl.build(:top)

    visit '/tops/new'
    select 'Sweater', from: 'Top type'
    select 'White', from: 'Color'
    attach_file "Pic", File.join(Rails.root, "spec/support/images/example.jpg")
    click_button 'Create Top'

    expect(page).to have_content 'New top successfully added'
    expect(page).to have_content top.top_type
    expect(page).to have_css("img[src*='uploads']")

  end


  scenario 'with invalid data' do

    visit '/tops/new'
    click_button 'Create Top'

    expect(page).to have_content "There were problems processing your order!"
    expect(page).to have_content "Top type can't be blank"
    expect(page).to have_content "Pic can't be blank"
    expect(page).to have_content "Color can't be blank"

  end

end
