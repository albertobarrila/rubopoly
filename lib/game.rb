class Game
  attr_accessor :players
  attr_accessor :rounds

  def initialize(players)
    fail 'players must be between 2 and 8' if players.size < 2 || players.size > 8
    self.players = players.shuffle
    self.rounds = 0
  end

  def play(turns)
    turns.times do 
      play_turn
    end
  end

  def play_turn
    self.rounds += 1
    players.each do |player|
      player.rounds += 1
    end
  end
end
