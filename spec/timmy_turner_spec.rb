
require 'spec_helper'

feature 'switch_turns' do

  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Alicia's turn"
    end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_link 'Attack'
      expect(page).not_to have_content 'Alicias turn'
      expect(page).to have_content "It is Shaun's turn"
    end
  end
end
