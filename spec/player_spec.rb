describe Player do

  subject(:player) {described_class.new}

  it 'return player' do
    expect(player.name).to eq "Andy"
  end
end
