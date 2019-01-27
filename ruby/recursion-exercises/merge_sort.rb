# Implement a method merge_sort that sorts an Array

class Array
    def merge_sort()
        if self.empty? || self.count == 1
            return self.clone
        end
        sorted = []
        pivot = (self.count / 2).floor
        left = self[0...pivot].merge_sort
        right = self[pivot..-1].merge_sort
        while left.count > 0
            if right.empty?
                sorted += left.slice!(0..-1)
                break
            end
            if left.first < right.first
                sorted << left.shift
            elsif left.first > right.first
                sorted << right.shift
            else
                sorted << left.shift
                sorted << right.shift
            end
        end
        if right.count > 0
            sorted += right.slice!(0..-1)
        end
        return sorted
    end
end