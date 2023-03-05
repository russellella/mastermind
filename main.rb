# Computer/Code Class
  # Method: generate code
    # 4 Random colors from a choice of 6
    # Use to compare and reveal at end

# Guess Board Class
  # Initialize: Create array - empty circles (to push user input to)
  # Method: Compare code to secret
    # Compare 2 arrays
      # If includes one of colors, push a white in hint board
      # Compare each index, and if equal, push red to hint board
  # Method: Change board

# Hint Board Class
  # Methods: Create array of four black squares

# Game Class
  # Initialize: Instructions
  # Play Loop - 12 times OR when game over
    # Guess Board | Hint Board
    # Get input
    # Push input to Guess Board
    # Run checker
  # Display win/loss message + code

  # Method: Win/Loss Messages




### Color Mark Reference ###
# Red Circle "\u{1F534}"
# Blue Circle "\u{1F535}"
# Orange Circle "\u{1F7E0}"
# Yellow Circle "\u{1F7E1}"
# Green Circle "\u{1F7E2}"
# Purple Circle "\u{1F7E3}"

# Black Square "\u2B1B"
# Red Square "\u{1F7E5}"
# White Square "\u2B1C"