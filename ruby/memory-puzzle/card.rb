class Card

  attr_reader :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    @value
  end

  def ==(another_card)
    if self.face_up == false || another_card.face_up == false
      return false
    end
    self.value == another_card.value
  end
end
