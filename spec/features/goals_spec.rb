require 'spec_helper'
require 'rails_helper'

feature "goals" do

  feature "user can create goals" do

    scenario "has a page for creating goals" do
      user = sign_in_as_robert
      visit new_user_goal_url(user)

      expect(page).to have_content("Create New Goal")
    end

    scenario "goal takes a title and privacy setting" do
      user = sign_in_as_robert
      visit new_user_goal_url(user)

      expect(page).to have_content("Title")
      expect(page).to have_content("Private")
      expect(page).to have_content("Public")
    end

    scenario "after creating goal, user is shown list of user's goals" do
      user = sign_in_as_robert
      visit new_user_goal_url(user)

      title = Faker::Hipster.sentence
      fill_in("Title", with: title)
      click_button("Submit")
      expect(page).to have_content("#{user.username}'s Goals")
      expect(page).to have_content(title)
    end



  end

  feature "user can update goals" do

  end

  feature "user can view goals" do

  end

  feature "user can delete goals" do

  end
end
