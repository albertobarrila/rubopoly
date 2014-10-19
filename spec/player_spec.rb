require_relative '../lib/player'
describe Player do
  it 'Player on beginning location (numbered 0), rolls 7, ends up on location 7' do
    player = Player.new('racecar')
    player.advance(7)
    expect(player.position).to eq(7)
  end

  it 'Player on location numbered 39, rolls 6, ends up on location 5' do
    player = Player.new('racecar', 39)
    player.advance(6)
    expect(player.position).to eq(5)
  end
end
