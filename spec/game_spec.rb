require_relative '../lib/player'
require_relative '../lib/game'

describe Game do
  it 'Create a game with two players named Horse and Car' do
    players = []
    players << Player.new('Horse')
    players << Player.new('Car')
    game = Game.new(players)
    expect(game.class).to eq(Game)
  end

  it 'Try to create a game with < 2 players. When attempting to play the game, it will fail' do
    players = []
    players << Player.new('Horse')

    expect{ Game.new(players) }.to raise_error
  end

  it 'Try to create a game with > 8 players. When attempting to play the game, it will fail' do
    players = []
    10.times do |i|
      players << Player.new("Horse_#{i}")
    end
    expect{ Game.new(players) }.to raise_error
  end

  it 'Create a game with two players named Horse and Car. Within creating 100 games, both orders [Horse, Car] and [car, horse] occur' do
    horse = Player.new('Horse')
    car = Player.new('Car')
    players = [horse, car]
    horse_car_case = false
    car_horse_case = false
    100.times do
      game = Game.new(players)
      horse_car_case |= game.players == [horse, car]
      car_horse_case |= game.players == [car, horse]
    end
    expect(horse_car_case).to be_truthy
    expect(car_horse_case).to be_truthy
  end

  it 'Create a game and play, verify that the total rounds was 20 and that each player played 20 rounds' do
    players = [
      Player.new('Horse'),
      Player.new('Car')
    ]

    game = Game.new(players)
    game.play(20)
    expect(game.rounds).to eq(20)

    players.each do |player|
      expect(player.rounds).to eq(20)
    end
  end

  it 'Create a game and play, verify that in every round the order of the players remained the same' do
    players = [
      Player.new('Horse'),
      Player.new('Car')
    ]

    game = Game.new(players)
    game_players = game.players
    20.times do 
      game.play(1)
      expect(game.players).to eq(game_players)
    end
  end
end
