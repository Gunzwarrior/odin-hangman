
require_relative 'display'

# Game class containing the game's logic 
class Game
  include Display

  def initialize
    @solution = 0
  end

  def play
    puts rules
  end

end