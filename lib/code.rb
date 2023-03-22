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