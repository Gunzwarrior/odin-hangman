
# Display module with all the game's text
module Display

  def rules
    <<~RULES
      Let's play a game of Hangman.
      You will have to guess the word by guessing
      a letter one at a time.
      You can have 7 wrong guesses before you lose.
      Enter a letter if you want to start guessing,
      exit if you want to save and exit, or load if
      you want to load your previous saved game.

    RULES

  end

  def prompt
    '> '
  end
  
end