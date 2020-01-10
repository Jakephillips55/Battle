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

  def opponent_of(the_player)
    players_who_are_not(player1).first
  end

  def game_over?
    losing_players.any?
  end

  def loser
    losing_players.first
  end

  private
  attr_reader :players

  def losing_players
    players.select { |player| player.hp <= 0 }
  end

  def players_who_are_not(the_player)
    players.select {|player| player != the_player }
  end
end
