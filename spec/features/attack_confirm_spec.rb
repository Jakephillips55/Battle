require 'spec_helper'

describe Battle, type: :feature do

  feature 'Attacking' do
    scenario 'attack Player 2' do
      sign_in_and_play
      click_link 'Attack'
      expect(page).to have_content 'Alicia attacked Shaun'
    end
    scenario 'reduce Player 2 HP by 10' do
      sign_in_and_play
      click_link 'Attack'
      # expect(page).not_to have_content 'Shaun: 100HP'
      # expect(page).to have_content 'Shaun: 90HP'
    end

  end

end
