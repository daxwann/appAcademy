class card

  attr_reader :value

  def initialize
    @value
    @face_up = 0
  end

  def hide
    @face_up = 0
  end

  def reveal
    @face_up = 1
  end

  def ==(another_card)
    self.value == another_card.value
  end
end
