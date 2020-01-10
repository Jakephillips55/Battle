require 'game'
require 'player'

describe Game do
  # subject(:game) { described_class.new }
  subject(:game) { described_class.new(player_1, player_2)}
  let(:player_1_name) {double(Player.new("Player1"))}
  let(:player_2_name) {double(Player.new("Player2"))}

  subject(:game) { described_class.new(player_1_name, player_2_name) }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1_name
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2_name
    end
  end

  describe '#attack' do
    it 'attacks player and gives damages' do
      expect(player_2_name).to receive(:dmg)
      game.attack(player_2_name)
    end
  end

  describe '#current_turn' do
    it 'starts as player1' do
      expect(game.current_turn).to eq player_1_name
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2_name
    end
  end 
end
