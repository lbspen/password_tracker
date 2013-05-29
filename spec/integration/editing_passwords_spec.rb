require 'spec_helper'

feature "Editing Passwords" do
  let!(:password) { create(:password) }

  before do
    visit "/"
    click_link "Edit"
  end
  
  scenario "Updating a password" do
    fill_in "Url", :with => "www.ggg.com"
    fill_in "Username", :with => "Emily"
    fill_in "Password", :with => "passw"
    click_button "Update Password"
    page.should have_content("Password has been updated")
    page.should have_content("www.ggg.com")
    page.should have_content("Emily")
    page.should have_content("passw")
  end

  scenario "Updating a password with invalid attributes is bad" do
    fill_in "Url", :with => ""
    fill_in "Username", :with => ""
    fill_in "Password", :with => ""
    click_button "Update Password"
    page.should have_content("Password has not been updated.")
    page.should have_content("Url can't be blank")
    page.should have_content("Username can't be blank")
    page.should have_content("Password can't be blank")
  end
end