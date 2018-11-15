require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0, :+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? {|string| string.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  arr = string.chars.select {|char| string.count(char) > 1 && char != " "}
  return arr.uniq
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  arr = string.split(" ").sort_by { |word| -word.length }
  return arr[0..1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  alpha = ('a'..'z')
  alpha.select {|char| !string.include?(char)}
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select {|year| not_repeat_year?(year)}
end

def not_repeat_year?(year)
  year.to_s.chars.uniq == year.to_s.chars
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  arr = songs.select {|song| no_repeats?(song, songs)}
  arr.uniq
end

def no_repeats?(song, songs)
  songs.each_with_index do |s, i|
    if s == song && songs[i + 1] == song
      return false
    end
  end
  return true
end


# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  cword = ""
  dist = string.length
  string.split(" ").each do |word|
    if !word.include?('c')
      next
    end
    cdist = c_distance(remove_punc(word))
    if cdist < dist
      cword = remove_punc(word)
      dist = cdist
    end
  end
  return cword
end

def remove_punc(word)
  newWord = ""
  word.each_char do |char|
    if char.downcase >= 'a' && char.downcase <= 'z'
      newWord += char
    end
  end
  return newWord
end

def c_distance(word)
  word.reverse.index('c')
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  ranges = []
  arr.each_with_index do |ele, idx|
    if repeat?(ele, idx, arr)
      ranges << [idx, last_idx(ele, idx, arr)]
    end
  end
  return ranges
end

def repeat?(ele, idx, arr)
  if ele == arr[idx - 1] || ele != arr[idx + 1]
    return false
  end
  return true
end

def last_idx(ele, idx, arr)
  (idx..(arr.length - 1)).each do |i|
    if arr[i] != ele
      return i - 1
    end
  end
  return arr.length - 1
end
