class Card
  attr_reader :name, :is_facedown, :matched

  def initialize(name)
    @is_facedown = true
    @name = name
    @matched = false
  end

  def hide_card
    @is_facedown = true
  end

  def show_card
    @is_facedown = false
  end

  def ==(other_card)
    self.name == other_card.name
  end
end