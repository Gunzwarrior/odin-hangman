# Board class used to display game informations to the player
class Board
  attr_accessor :solution, :mistake, :guesses
  def initialize
    @solution = nil
    @mistake = 0
    @guesses = []
  end

  def one_mistake
    @mistake += 1
  end

  def show_feedback
    puts "#{solution.join(' ')} | letters tried #{guesses.uniq.join(', ')} | #{mistake} / 7 mistakes allowed."
    puts
  end
end
