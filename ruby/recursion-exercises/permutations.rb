require "byebug"

# Write a recursive method permutations(array) that calculates all the permutations 
# of the given array. For an array of length n there are n! different permutations. 
# So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(array)
    if array.empty?
        return [[]]
    end
    if array.count == 1
        return [array.clone]
    end
    arr = []
    array.each_with_index do |ele, idx|
        cpy = array.clone
        cpy.delete_at(idx)
        permutations(cpy).each do |perm|
            arr << [ele] + perm
        end
    end
    return arr
end