require_relative 'display'
require_relative 'player'

# Game class containing the game's logic 
class Game
  include Display

  attr_accessor :solution

  def initialize
    @solution = pick_solution
    @player = Player.new
  end

  def play
    puts rules
    puts command_list
  end 

  def select_game(choice)
    keep_going = true
    while keep_going
      if choice == ''
        # start new game
      elsif choice.downcase == 'exit'
        # exit game
      elsif choice.downcase == 'load'
        # load game
      else
        puts command_list
      end
    end
  end

  def pick_solution
    solution_string = open('google_10000_english_no_swears.txt', 'r')
    solution_array = []
    until solution_string.eof?
      line = solution_string.readline.chomp
      solution_array.push(line) if line.length >= 5 && line.length <= 12
    end
    solution_array.sample
  end

end