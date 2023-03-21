class Board
  attr_accessor :board
  
  def initialize
    @board = []
  end

  def add_color(color)
    @board << color
  end

#  def display_color
#    temp_board = @board
#    temp_board.map! { |key| COLOR_CODE.fetch(key) }
#    puts temp_board.join("")
#  end

  def display
    puts board.join("")
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
    puts "Time to play a game of Mastermind!
    The computer will generate a code of four random colors out of six possible, and you have twelve turns to guess it.
    After each guess, you'll get a code back telling you how close you are: a red square for each correct color guessed in the right spot, and a white square for each correct color in an incorrect spot.
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
  end
  
  def play
    12.times do
      break if equal?
      get_user_input
      p @guess_board.board
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
    temp_array.replace(@guess_board.board)
    @guess_board.board.map.with_index do |v, i|
      if v == @secret_code.code[i]
        @hint_board.add_color("\u{1F7E5}")
        temp_array.delete_at(i)
      end
    end
    temp_array.map do |i|
      if @secret_code.code.include?(i)
        @hint_board.add_color("\u2B1C")
      end
    end
  end

  def equal?
    @secret_code.code == @guess_board.board
  end
  
  def game_end_message
    @secret_code.display_final
    if equal?
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
}

new_game = Game.new
new_game.play