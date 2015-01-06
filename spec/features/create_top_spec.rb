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

    @my_file = FactoryGirl.create(:my_file)

    visit '/tops/new'
    select 'Sweater', from: 'Top type'
    select 'White', from: 'Color'
    attach_file ("My file", 'spec/fixtures/myfiles/myfile.jpg')
    click_button 'Create Top'

    expect(page).to have_content 'New top successfully added'
    expect(page).to have_content top.top_type
    expect(page).to have_xpath "/uploads/top/pic/#{params[:id]}/myfile.jpg"
  end
end
