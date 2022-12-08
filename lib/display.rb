
# Display module with all the game's text
module Display

  def rules
    <<~RULES
      Let's play a game of Hangman.
      You will have to guess the word by guessing
      a letter one at a time.
      You can have 7 wrong guesses before you lose.
    RULES

  end

  def command_list
    <<~COMMAND_LIST
      - To start a new game, press Enter
      - To load your previous saved game, type 'load'.
      - To save and exit, type 'exit'.

    COMMAND_LIST
  end

  def play_rules
    <<~PLAY_RULES
      - Enter a letter to guess
      - Enter 'exit' to save and exit

    PLAY_RULES
  end

  def prompt
    '> '
  end

  def win
    'Congratulation, you won !'
  end
  
  def lose
    'No more tries. You lose.'
  end

end