# First, write a 'greedy' version called greedy_make_change:
# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining 
# amount, leaving out the biggest coin, until the remainder is zero.

def greedy_make_change(amt, coins = [25, 10, 5, 1])
    if amt == 0
        return []
    end
    if amt < coins.first
        return greedy_make_change(amt, coins[1..-1])
    end
    change = []
    while amt >= coins.first
        amt -= coins.first
        change << coins.first
    end
    return change + greedy_make_change(amt, coins[1..-1])
end

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as 
# many 10 pieces as possible, greedy_make_change misses the correct answer of 
# [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out 
# denominations that we've already used. This allows each coin to be available 
# each time we get a new remainder. By iterating over the denominations and 
# continuing to search for the best change, we assure that we test for 'non-greedy' 
# uses of each denomination.

def make_better_change(amt, coins = [25, 10, 5, 1])
    if amt == 0
        return []
    end
    if amt < coins.first
        return make_better_change(amt, coins[1..-1])
    end
    min = nil
    choice = nil
    coins.each do |coin|
        remainder = make_better_change(amt - coin, coins)
        if !min || remainder.count < min.count
            min = remainder
            choice = coin
        end
    end
    return [choice] + min
end