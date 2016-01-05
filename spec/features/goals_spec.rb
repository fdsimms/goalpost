require 'spec_helper'
require 'rails_helper'

feature "goals" do

  feature "user can create goals" do

    scenario "has a page for creating goals" do
      user = sign_in_as_robert
      visit new_user_goal_url(user)

      expect(page).to have_content("Create New Goal")
    end

    scenario "takes a goal and privacy setting"

  end

  feature "user can update goals" do

  end

  feature "user can view goals" do

  end

  feature "user can delete goals" do

  end
end
