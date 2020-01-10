require 'spec_helper'

describe Battle, type: :feature do

  feature "Viewing hit points" do
    scenario 'shows hit points' do
      sign_in_and_play
      # expect(page).to have_content('Shuan: 100HP')
      expect(page).to have_content('Alicia: 100HP')
    end
  end

end
