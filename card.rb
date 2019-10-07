class Card
  attr_reader :name, :is_facedown

  def initialize(name)
    @is_facedown = true
    @name = name
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