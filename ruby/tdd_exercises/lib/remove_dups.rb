class Array
    def my_uniq
        uniq_arr = []
        self.each_with_object({}) do |ele, hash|
            if hash[ele].nil?
                uniq_arr << ele
                hash[ele] = 1
            end
        end
        return uniq_arr
    end
end