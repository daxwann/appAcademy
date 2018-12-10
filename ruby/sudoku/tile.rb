class Tile
  attr_reader :value, :given

  def initialize(val)
    @value = val
    @given = (val == 0 ? false : true)
  end

  def to_s
    self.value.to_s
  end

  def change(val)
    if @given == false
      @value = val
    else
      @value
    end
  end

end
