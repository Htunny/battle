require 'player'

describe Player do

  subject(:player) {described_class.new('Andy')}
  starting_hp = Player::STARTING_HP


  it 'return player' do
    expect(player.name).to eq 'Andy'
  end

  it 'shows default HP' do
    expect(player.hp).to eq starting_hp
  end

  it 'gets attacked' do
    expect{player.gets_attacked}.to change{player.hp}.by -10
  end
end
