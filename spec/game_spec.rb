require 'game'
require 'player'

describe Game do
  # subject(:game) { described_class.new }
  let(:player_1_name) {double(Player.new("Player1"))}
  let(:player_2_name) {double(Player.new("Player2"))}

  subject(:game) { described_class.new(player_1_name, player_1_name) }

  describe '#attack' do
    it 'attacks player and gives damages' do
      expect(player_2_name).to receive(:dmg)
      game.attack(player_2_name)
    end
  end
end
