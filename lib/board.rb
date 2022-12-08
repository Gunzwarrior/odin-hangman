# Board class used to display game informations to the player
class Board
  attr_accessor :solution, :tries
  def initialize
    @solution = nil
    @tries = []
  end

  def show_solution
    puts solution
  end
end
