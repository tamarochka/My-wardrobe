# require 'rails_helper'
#
# feature 'User adds a new clothing with small image(less than 300x300)', %Q{
#   As an authenticated user
#   I want to add an image that is not too small
#   So that i can use it in outfit
#   } do
#
#   before :each do
#     @user = FactoryGirl.create(:user)
#     login_as(@user)
#   end
#
#   scenario 'with valid data' do
#
#     visit '/clothings/new'
#
#     select 'Top', from: 'Clothing type'
#     select 'Blue', from: 'Color'
#     select 'Any', from: 'Weather'
#     attach_file "Image", File.join(Rails.root, "spec/support/images/example_small.jpg")
#
#     click_button 'Create Clothing'
#
#     expect(page).not_to have_content 'New clothing was successfully added!'
#     expect(Clothing.count).to eq 0
#     expect(page).to have_content "There were problems processing your order!"
#     expect(page).to have_content "should be 300x300px minimum!"
#
#   end
# end
