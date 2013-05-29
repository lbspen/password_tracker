require 'spec_helper'

feature "Deleting password -" do
  scenario "Deleting a password" do
    password = Factory(:password)
    url = password.url
    username = password.username
    password = password.password
    visit "/"
    click_link "Delete"
    page.should have_content("Password has been deleted.")
    visit "/"
    page.should_not have_content(url)
    page.should_not have_content(username)
    page.should_not have_content(password)
  end
end