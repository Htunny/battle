require 'sinatra/base'
require_relative 'player'
require_relative 'game'

class Battle < Sinatra::Base

   $game = Game.new

  enable :sessions

  get '/' do
    'Hello Battle!'
   erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @hp2 = $player_2.hp
    @hp1 = $player_1.hp
    erb :play
  end

  post '/fight' do
    $game.attack($player_1, $player_2)
    redirect '/attack'
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :attack
  end

  run! if app_file == $0
 end
