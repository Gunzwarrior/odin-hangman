
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

  def prompt
    '> '
  end
  
end