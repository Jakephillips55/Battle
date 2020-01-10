require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
   enable :Player


  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)

    # $game = Game.new(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))
    # erb(:play)

    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    @game = Game.instance
    @game.attack(@game.player1)
    @game.switch_turns
    if @game.game_over?
      redirect '/game_over'
    end
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player2)
    @game.switch_turns
    if @game.game_over?
      redirect '/game_over'
    end
    erb :attack
  end

  get '/game_over' do
    erb :game_over
  end
   # get '/confirm_attack' do
  #  @player_1_name = $player_1.name
  #  @player_2_name = $player_2.name
  #   @player_1_hp = $player_1.dmg
  #   @player_2_hp = $player_2.dmg
   #   erb :confirm_attack
   # end

   def self.create(player_1_name, player_2_name)
     @game = Game.new(player_1_name, player_2_name)
   end

   def self.instance
     @game
   end

  run! if app_file ==$0
end
