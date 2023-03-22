class Board
  attr_accessor :board
  
  def initialize
    @board = []
  end

  def add_color(color)
    @board << color
  end

  def display
    puts @board.map { |key| COLOR_CODE.fetch(key) }.join("")
  end
end

class Code
  attr_accessor :code
  def initialize
    @code = []
    generate_code
  end

  def generate_code
    4.times { @code.push(["R", "O", "Y", "G", "B", "P"].shuffle.first) }
  end

  def equal?
    @code == @guess_board
  end

  def display_final
    @code.map! { |key| COLOR_CODE.fetch(key) }
    puts code.join("")
  end
end

class Game
  
  def initialize
    @guess_board = Board.new
    @hint_board = Board.new
    @secret_code = Code.new
    @win = false
    puts "Time to play a game of Mastermind!
    The computer will generate a code of four random colors out of six possible, and you have twelve turns to guess it.
    After each guess, you'll get a code back telling you how close you are: a red square for each correct color guessed in the right spot, and a white square for each correct color in an incorrect spot.
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
    p @secret_code ### FOR TESTING ###
  end
  
  def play
    12.times do
      get_user_input
      break if check_equal
      @guess_board.display
      compare
      @hint_board.display
      @hint_board.board.clear
      @guess_board.board.clear
    end
    game_end_message
  end

  def get_user_input
    while input = gets.chomp
        if input =~ /\A[ROYGBP]*\z/ && input.length == 4
          input.split("")
          @guess_board.board.replace(input.split(""))
          break
        else
          puts "Uh oh! Please only input a combination of 4 of these colors: ROYGBP"
        end
    end
  end
  
  def compare
    temp_array = []
    temp_array.replace(@secret_code.code)
    @guess_board.board.map.with_index do |v, i|
      if v == @secret_code.code[i]
        @hint_board.add_color("H")
        @guess_board.board[i] = 0
        temp_array[i] = 1
      end
    end
    @guess_board.board.map.with_index do |v, i|
      if temp_array.include?(v)
        @hint_board.add_color("W")
      end
    end
  end

  def check_equal
    if @secret_code.code == @guess_board.board
      @win = true
    end
  end
  
  def game_end_message
    @secret_code.display_final
    if @win == true
      puts "You win! You guessed the code correctly."
    else
      puts "You lose. You didn't guess the code."
    end
  end
  
end


COLOR_CODE = {
  "R" => "\u{1F534}",
  "O" => "\u{1F7E0}",
  "Y" => "\u{1F7E1}",
  "G" => "\u{1F7E2}",
  "B" => "\u{1F535}",
  "P" => "\u{1F7E3}",
  "H" => "\u{1F7E5}",
  "W" => "\u2B1C"
}

new_game = Game.new
new_game.play