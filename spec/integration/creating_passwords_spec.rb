require 'spec_helper'

feature 'Creating Passwords -' do
  scenario "Can create a password" do
    visit '/'
    click_link 'New Password'
    fill_in 'Url', :with => 'www.abc.com'
    fill_in 'Username', :with => 'hacker'
    fill_in "Password", :with => "password"
    click_button 'Create Password'
    page.should have_content('Password was successfully created.')
    page.should have_content('www.abc.com')
    page.should have_content('hacker')
    page.should have_content('password')
    page.find_link("Back")[:href].should == root_path
  end
  
  scenario "Can not create a password without fields" do
    visit '/'
    click_link 'New Password'
    click_button 'Create Password'
    page.should have_content("Password has not been created.")
    page.should have_content("Url can't be blank")
    page.should have_content("Username can't be blank")
    page.should have_content("Password can't be blank")
    page.current_url == new_password_url
  end
end
