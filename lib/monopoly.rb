require_relative 'player'
require_relative 'game'

players = [
  Player.new('Horse'),
  Player.new('Car')
]

game = Game.new(players)
puts 'Game created'
game.play(20)
puts 'Let\'s play!'
