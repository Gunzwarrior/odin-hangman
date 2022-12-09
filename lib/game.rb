# frozen_string_literal: true

require_relative 'display'
require_relative 'board'
require 'yaml'

# Game class containing the game's logic
class Game
  include Display

  attr_accessor :solution, :board

  def initialize
    @solution = pick_solution
    @board = Board.new
  end

  def start
    puts rules
    puts command_list
    print prompt
    select_game
    play
  end

  def save_game
    serialized_state = serialize_state
    Dir.mkdir('saved_game') unless Dir.exist?('saved_game')
    save_file = 'saved_game/save.txt'
    File.open(save_file, 'w') do |file|
      file.puts(serialized_state)
    end
  end

  def serialize_state
    saved_data_hash = {
      solution: solution,
      mistakes: board.mistake,
      guesses: board.guesses,
      board_solution: board.solution
    }
    YAML.dump(saved_data_hash)
  end

  def load_game
    save_file = 'saved_game/save.txt'
    saved_hash = YAML.safe_load(File.read(save_file), permitted_classes: [Symbol])
    @solution = saved_hash[:solution]
    board.mistake = saved_hash[:mistakes]
    board.guesses = saved_hash[:guesses]
    board.solution = saved_hash[:board_solution]
    @solution = saved_hash[:solution]
    board.mistake = saved_hash[:mistakes]
    board.guesses = saved_hash[:guesses]
    board.solution = saved_hash[:board_solution]
  end

  def play
    puts board.show_feedback
    puts play_rules
    print prompt
    keep_going = true
    tries = 0
    while keep_going
      input = gets.chomp.downcase
      if input.match?(/[a-z]/) && input.length == 1
        check_match(input)
        tries += 1
        board.show_feedback
        break if game_over?

        print prompt
      elsif input == 'exit'
        save_game
        exit
      else
        puts play_rules
        print prompt
      end
    end
  end

  def game_over?
    if board.solution == solution
      puts win
      puts "#{solution.join('')} was the word to find"
      true
    elsif board.mistake == 7
      puts lose
      puts "#{solution.join('')} was the word to find"
      true
    end
  end

  def check_match(input)
    board.guesses.push(input)
    temp_solution = board.solution.dup
    solution.each_index do |index|
      board.solution[index] = solution[index] if solution[index] == input
    end
    board.one_mistake if temp_solution == board.solution
  end

  def select_game
    keep_going = true
    while keep_going
      choice = gets.chomp
      exit if choice.downcase == 'exit'
      if choice == ''
        hide_solution(solution)
        keep_going = false
      elsif choice.downcase == 'load'
        load_game
        keep_going = false
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
