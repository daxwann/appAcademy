class Array
  def two_sum
    return nil if self.empty? || self.count == 1
    hash = Hash.new
    pairs = []
    self.each_with_index do |ele, idx|
      next unless ele.is_a?(Integer)
      if hash.has_value?(0 - ele)
        matches = hash.select { |key, val| val == (0 - ele) }.keys
        matches.each { |key| pairs << [key, idx] }
      end
      hash[idx] = ele
    end
    return nil if pairs.empty?
    return pairs.sort_by { |pair| pair.first }    
  end
end