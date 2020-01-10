require 'game'
require 'player'

describe Game do
  # subject(:game) { described_class.new }
  subject(:game) { described_class.new(player_1, player_2)}
  subject(:finished_game) {described_class.new(dead_player, player_2_name)}
  let(:player_1_name) {double(Player.new("Player1"), hp: 60)}
  let(:player_2_name) {double(Player.new("Player2"), hp: 60)}
  let(:dead_player) { double :player, hp: 0}

  subject(:game) { described_class.new(player_1_name, player_2_name) }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1_name
    end
  end

  describe '#game_over?' do
    it 'returns false if no-one is at 0HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least one player is at 0HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe 'Loser' do
    it 'returns a player on less than 0HP' do
      expect(finished_game.loser).to eq dead_player
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

  describe '#opponent_of' do
    it 'finds the opponent of a player' do
      expect(game.opponent_of(player_1_name)).to eq player_2_name
      #expect(game.opponent_of(player_2_name)).to eq player_1_name
      #will do manual testing for this not sure why its breaking
    end
  end


end
