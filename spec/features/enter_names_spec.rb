require 'spec_helper'

describe Battle, type: :feature do

  feature "Enter names" do
    scenario 'players fill in names' do
      sign_in_and_play
      expect(page).to have_content("Alicia vs Shaun")
    end
  end
end
