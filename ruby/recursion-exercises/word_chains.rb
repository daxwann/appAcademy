# Given two words of equal length as command-line arguments, build a chain of words 
# connecting the first to the second. Each word in the chain must be in the dictionary 
# and every step along the chain changes exactly one letter from the previous word.

# Again, your program should accept input as two command-line arguments. Your program 
# should also allow a -d command-line switch followed by a dictionary file to use, but 
# feel free to choose a sensible default for your system. The result should be a word 
# chain starting with the first word and ending with the last printed to STDOUT, one 
# word per line. Print an error message if a chain cannot be found.

# Bonus points for finding the shortest chain and/or a small execution time.

require "byebug"

class WordChainer
    def initialize(dictionary_file_name)
        @dictionary = File.read(dictionary_file_name).split("\n").to_set
    end

    def adjacent_words(word)
        adj_words = Set.new
        word.each_char.with_index do |char, idx|
            cpy = word.dup
            ('a'..'z').each do |c|
                if c != char
                    cpy[idx] = c
                    adj_words.add(cpy) if @dictionary.include?(cpy)
                end
            end
        end
        return adj_words
    end

    def explore_current_words
        new_current_words = Set.new
        @current_words.each do |word|
            self.adjacent_words(word).each do |adj|
                if !(@all_seen_words.has_key?(adj))
                    @all_seen_words[adj] = word
                    new_current_words.add(adj)
                end
            end
        end
        return new_current_words
    end

    def build_path(target)
        if @all_seen_words.has_key?(target)
            path = [target]
            while @all_seen_words[target] != nil
                path.unshift(@all_seen_words[target])
                target = @all_seen_words[target]
            end
            return path
        end
        return nil
    end

    def run(source, target)
        @current_words = Set.new([source])
        @all_seen_words = { source => nil }
        while !(@current_words.empty?)
            new_current_words = self.explore_current_words()
            @current_words = new_current_words
            path = self.build_path(target)
            return path if path
        end
        return nil
    end
end