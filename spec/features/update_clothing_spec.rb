require "rails_helper"

feature "User updates an existing clothing item", %{
  As an authenticated user
  I want to update an existing clothing item
  So that others can view that update
  } do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)
    end

    scenario "with valid data" do
      @clothing = FactoryGirl.create(:clothing, user_id: @user.id)

      visit "/clothings/#{@clothing.id}/edit"
      select "Black", from: "Color"
      click_on "Update"
      expect(page).to have_content "Your clothing item was updated"
      expect(page).to have_content "Black Sweater"
    end
  end
