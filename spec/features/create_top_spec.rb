require 'rails_helper'

feature 'User adds a new top', %Q{
  As an authenticated user
  I want to add a new weather
  So that others can review it
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'with valid data' do
    top = FactoryGirl.create(:top)
    visit '/tops/new'
    select 'sweater', from: 'type'
    select 'white', from: 'color'
    # fill_in 'Pic', with: top.pic
    click_button 'Create Top'

    expect(page).to have_content 'New top successfully added'
    expect(page).to have_content top.type
    # expect(page).to have_content top.pic
  end
end
