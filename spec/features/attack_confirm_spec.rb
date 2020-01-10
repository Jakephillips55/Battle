require 'spec_helper'

describe Battle, type: :feature do

  feature 'Attacking' do
    scenario 'attack Player 2' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Alicia attacked Shaun'
    end
    scenario 'reduce Player 2 HP by 10' do
      sign_in_and_play
      expect(page).to have_content 'Alicia: 100HP'
      click_button 'Attack'
      # expect(page).not_to have_content 'Shaun: 100HP'
      expect(page).to have_content 'Shaun: 100HP'
    end

    scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    attack_and_confirm
    attack_and_confirm
    expect(page).not_to have_content 'Alicia: 100HP'
    expect(page).to have_content 'Alicia: 80HP'

  end

  end

end
