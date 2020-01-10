require 'spec_helper'

feature 'Game over' do
  context 'When player 1 hits 0 HP first' do
    before do
      sign_in_and_play
      attack_and_confirm
      allow(Kernel).to receive(:rand).and_return(60)
    end

    scenario 'player 1 Lose' do
      click_button 'Attack'
      expect('/game_over').to have_content 'Alicia loses!'
    end
  end
end
