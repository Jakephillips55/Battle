require_relative 'player'

class Game
  attr_reader :player1, :player2, :current_turn

  def initialize(player1, player2)
    @players = [@player1 = player1, @player2 = player2]
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.dmg
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  private

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end
  
end
