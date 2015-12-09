require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello Battle!'
   erb :index
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $game.show_players[0].name
    @player_2_name = $game.show_players[1].name
    @hp1 = $game.player_1.hp
    @hp2 = $game.player_2.hp
    erb :play
  end

  post '/fight' do
    $game.attack($game.player_1, $game.player_2)
    redirect '/attack'
  end

  get '/attack' do
    @player_1_name = $game.player_1.name
    @player_2_name = $game.player_2.name
    erb :attack
  end

  run! if app_file == $0
 end
