class Tile
  attr_reader :value, :given

  def initialize(val, given)
    @value = val
    @given = given
  end

  def to_s
    self.value.to_s
  end

  def change(val)
    @value = val
  end

end
