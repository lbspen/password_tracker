require 'spec_helper'

feature "Viewing passwords -" do
  scenario "Listing all passwords" do
    password = Factory.create(:password)
    visit '/'
    page.should have_content(password.url)
    page.should have_content(password.username)
    page.should have_content(password.password)
  end
end