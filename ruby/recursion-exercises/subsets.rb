require "byebug"

# Write a method subsets that will return all subsets of an array.

def subsets(array)
    if array.empty?
        return Array[[]]
    end
    last = array.pop
    before_last = subsets(array)
    new_arr = before_last.clone
    before_last.each do |subset|
        cpy = subset.clone
        new_arr << (cpy << last)
    end
    return new_arr
end