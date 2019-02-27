class Array
  def my_transpose
    new_matrix = self.class.new
    row_length = nil
    self.each_with_index do |row, idx|
      raise TypeError unless row.is_a?(Array)
      if row_length.nil?
        row_length = row.count
        row_length.times { |i| new_matrix << self.class.new }
      else
        raise IndexError unless row.count == row_length
      end
      row.each_with_index do |col, idx|
        new_matrix[idx] << col
      end
    end
    return new_matrix
  end
end