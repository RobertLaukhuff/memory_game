require "byebug"
require_relative "./board.rb" 
require_relative "./card.rb"

class MemoryGame
  def initialize(board_size)
    @board_size = board_size
  end

  def play
    board = Board.new(@board_size)
    board.make_cards
    board.populate  
    while !game_over?(board)
      system("clear")
      board.render
      if do_guesses_match?(board)
        board.matches += 1
      end
    end
    board.render
    print "\nYou Won!!!\n\n"
  end

  def game_over?(board)
    board.won?
  end

  def do_guesses_match?(board)
    first_guess, second_guess = make_guess
    first_row = first_guess[0]
    first_col = first_guess[1]
    board.board[first_row][first_col].show_card
    board.render
    sleep(2)
    system("clear")

    second_row = second_guess[0]
    second_col = second_guess[1]
    board.board[second_row][second_col].show_card
    board.render
    sleep(2)
    
    if board.board[first_row][first_col] == board.board[second_row][second_col]
      system("clear")
      return true
    else
      print "\nSorry, but that was not a match\n\n"
      board.board[first_row][first_col].hide_card
      board.board[second_row][second_col].hide_card
      sleep(2)
      system("clear")
      return false
    end
  end

  def get_guess
    gets.chomp.split(',').map! {|val| val.to_i}
  end

  def make_guess
    print "\nEnter your first card location: "
    first_card = get_guess
    print "\nEnter your second card location: "
    second_card = get_guess
    [first_card, second_card]
  end
end

game = MemoryGame.new(4)
game.play

