require "rails_helper"

feature "User deletes an existing clothing item", %{
  As an authenticated user
  I want to remove an existing clothing item
  So that it won't come up in any future outfits
  } do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)
    end

    scenario "clothing deleted" do
      @clothing = FactoryGirl.create(:clothing, user_id: @user.id)

      visit "/clothings/#{@clothing.id}"

      click_on "Delete"

      expect(page).to have_content "Your clothing item was deleted"
      expect(page).not_to have_content "White Top Sweater"
    end

  end
