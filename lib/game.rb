require_relative 'display'
require_relative 'player'
require_relative 'board'

# Game class containing the game's logic 
class Game
  include Display

  attr_accessor :solution, :board

  def initialize
    @solution = pick_solution
    @player = Player.new
    @board = Board.new
  end

  def start
    puts rules
    puts command_list
    print prompt
    select_game
    play
  end

  def play
    p solution
    p board.solution
    p validity_checker(gets.chomp)
  end 

  def validity_checker(input)
    true if input.match?(/[a-z]/) && input.length == 1
    true if input == 'exit'
  end  
  
  def select_game
    keep_going = true
    while keep_going
      choice = gets.chomp
      if choice == ''
        hide_solution(solution)
        keep_going = false
      elsif choice.downcase == 'exit'
        # code to save game. Just exit for now
        exit
      elsif choice.downcase == 'load'
        # code to load game. Just message for now
        puts 'Not yet implemented'
      else
        puts command_list
        print prompt
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
    solution_array.sample.split('')
  end

  def hide_solution(solution)
    board.solution = Array.new(solution.length, '_')
  end

end