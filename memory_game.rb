require "byebug"
require_relative "./board.rb" 
require_relative "./card.rb"

class MemoryGame
  def initialize(board_size)
    @board_size
  end

  def play
    game = Board.new(board_size)
    game.make_cards
    game.populate  
    while !game_over?

    end

  end

  def game_over?
    @board_instance.won?
  end

  def render

  end

  def prompt
    print "\nEnter your first card location: "
    first_card = get_guess
    print "\nEnter your second card location: "
    second_card = get_guess
    [first_card, second_card]
  end

  def get_guess
    gets.chomp.to_i
  end

  def make_guess(guess)

  end
end

