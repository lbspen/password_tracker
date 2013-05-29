require 'spec_helper'

feature "Viewing passwords -" do
  let! (:password) { create(:password) }

  before do
    visit '/'
  end

  scenario "Listing all passwords" do
    page.should have_content(password.url)
    page.should have_content(password.username)
    page.should have_content(password.password)
    page.find_link("Show")[:href].should == password_path(password)
    page.find_link("Edit")[:href].should == edit_password_path(password)
  end

  scenario "Viewing a single password" do
    click_link("Show")
    page.find_link("Back")[:href].should == root_path
    page.find_link("Edit")[:href].should == edit_password_path(password)
  end
end