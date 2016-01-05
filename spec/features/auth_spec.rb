require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit new_user_url
      user = User.new(username: "Robert", password: "password")

      fill_in("Username", with: user.username)
      fill_in("Password", with: user.password)
      click_button("Submit")
      expect(page).to have_content(user.username)
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    user = sign_in_as_robert

    expect(page).to have_content(user.username)
  end

end

feature "logging out" do

  scenario "begins with logged out state" do
    visit new_user_url
    expect(page).to have_no_content("Logged in as")

    user = sign_in_as_robert
    visit new_user_url
    expect(page).to have_content("Logged in as")
  end

  scenario "doesn't show username on the homepage after logout"

end
