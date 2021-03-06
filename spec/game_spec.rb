require 'game'

describe Game do

  subject(:game)  { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }


describe '#attack' do
  it 'has player_1 attack player_2' do
    expect(player_2).to receive(:gets_attacked)
    game.attack(player_1, player_2)
   end

   it 'has player_2 attack player_1' do
     expect(player_1).to receive(:gets_attacked)
     game.attack(player_2, player_1)
    end
  end

describe '#show_players'
  it 'loads a new game with 2 players' do
    expect(game.show_players).to eq [player_1, player_2]
  end
end
