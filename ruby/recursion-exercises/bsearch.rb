# Write a recursive binary search: bsearch(array, target). 
# Note that binary search only works on sorted arrays. 
# Make sure to return the location of the found object (or nil if not found!).

def bsearch(array, target)
    if array.empty?
        return nil
    end
    pivot = (array.count / 2).floor
    if array[pivot] == target
        return array.index(target)
    end
    left = bsearch(array[0...pivot], target)
    if left
        return left
    end
    right = bsearch(array[pivot + 1..-1], target)
    if right
        return pivot + 1 + right
    end
    return nil
end