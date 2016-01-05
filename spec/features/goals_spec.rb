require 'spec_helper'
require 'rails_helper'

feature "goals" do

  feature "user can create goals" do

    scenario "has a page for creating goals" do
      user = sign_in_as_robert
      visit new_user_goal_url(user)

      expect(page).to have_content("Create New Goal")
    end

    scenario "user must be logged in to create goal" do
      user = sign_in_as_robert
      user.reset_session_token!
      visit new_user_goal_url(user)

      expect(page).to have_content("Must be logged in.")
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

    scenario "index page shows all user's goals" do
      user = sign_in_as_robert
      5.times do
        Goal.create!(title: Faker::Hipster.sentence, user_id: user.id)
      end

      visit user_goals_url(user)
      user.goals.each do |goal|
        expect(page).to have_link(goal.title)
      end
    end

  end

  feature "user can view goals" do

    scenario "each goal has a show page" do
      user = sign_in_as_robert
      goal = Goal.create!(title: Faker::Hipster.sentence, user_id: user.id)
      visit goal_url(goal)
      expect(page).to have_content(goal.title)
    end

    scenario "goal page has edit and delete button" do
      user = sign_in_as_robert
      goal = Goal.create!(title: Faker::Hipster.sentence, user_id: user.id)
      visit goal_url(goal)
      expect(page).to have_button("Edit Goal")
      expect(page).to have_button("Delete Goal")
    end

  end

  feature "user can update goals" do

    scenario "has a page for editing goals" do
      user = sign_in_as_robert
      goal = Goal.create!(title: Faker::Hipster.sentence, user_id: user.id)
      visit goal_url(goal)
      click_button("Edit Goal")
      expect(page).to have_content("Edit Goal")
    end

    scenario "changes are reflected in goal show page" do
      user = sign_in_as_robert
      goal = Goal.create!(title: Faker::Hipster.sentence, user_id: user.id)
      visit edit_goal_url(goal)

      new_title = Faker::Hacker.say_something_smart
      fill_in("Title", with: new_title)
      click_button("Submit")
      expect(page).to have_content(new_title)
    end

  end


  feature "user can delete goals" do

    scenario "deletes goal" do
      user = sign_in_as_robert
      goal = Goal.create!(title: Faker::Hipster.sentence, user_id: user.id)
      visit goal_url(goal)
      click_button("Delete Goal")

      expect(page).to have_no_content(goal.title)
    end

  end
end
