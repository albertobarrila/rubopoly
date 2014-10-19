class Player
  attr_accessor :name
  attr_accessor :position
  attr_accessor :rounds

  def initialize(name, beginning_location = 0)
    self.name = name
    self.position = beginning_location
    self.rounds = 0
  end

  def advance(positions)
    self.position = (position + positions) % 40
  end

  def play_turn
    self.rounds += 1
  end
end
