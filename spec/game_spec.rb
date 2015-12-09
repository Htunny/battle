require 'game'

describe Game do

  subject(:game)  {described_class.new}
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  it 'has player_1 attack player_2' do
    expect(player_2).to receive(:gets_attacked)
    game.attack(player_1, player_2)
  end
end
