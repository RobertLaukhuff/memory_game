require_relative "card.rb"

class Board
  ALPHABET = ("A".."Z").to_a

  attr_reader :cards, :board

  def initialize(board_size)
    @board = Array.new(board_size) {Array.new(board_size, ' ')}
    @cards = Array.new(board_size * board_size)
  end

  def make_cards
    iter = 0
    while iter < @cards.length
      new_card_name = ALPHABET.sample
      @cards[iter] = Card.new(new_card_name)
      @cards[iter + 1] = Card.new(new_card_name)
      index = ALPHABET.index(new_card_name)
      ALPHABET.slice!(index...index + 1)
      iter += 2
    end
  end

  def populate
    rand(1..9).times {@cards.shuffle!}

    iter = 0
    (0...@board.length).each do |row|
      (0...@board.length).each do |col|
        @board[row][col] = @cards[iter]
        iter += 1
      end
    end
  end

  def render
    print "  "
    (0...@board.length).each {|iter| print "#{iter} "}
    print "\n"
    (0...@board.length).each do |row|
      print "#{row} "
      (0...@board.length).each do |col|
        if @board[row][col].is_facedown
          print "  "
        else
          print "#{@board[row][col].name} "
        end
      end
      print "\n"
    end
  end

  def won?
    @board.each.all? {|card| card == ' '}
  end

  def reveal(guessed_position)
    row, col = *guessed_position
    @board[row][col].show_card 
  end

  def hide
    (0...@board.length).each do |row|
      (0...@board.length).each do |col|
        @board[row][col].hide_card
      end
    end
  end
end

b = Board.new(4)
b.make_cards
b.populate
print "\nprint board\n\n"
b.render
b.reveal([0, 0])
b.reveal([1, 1])
print "\nprint board\n\n"
b.render
b.reveal([1, 2])
b.reveal([0, 3])
print "\nprint board\n\n"
b.render
b.hide
print "\nprint board\n\n"
b.render
print "#{b.won?}"