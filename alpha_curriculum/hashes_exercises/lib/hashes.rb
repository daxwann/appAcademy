# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  strlen = {}
  str.split(" ").each do |word|
    if !strlen.has_key?(word)
      strlen[word] = word.length
    end
  end
  return strlen
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  arr = hash.sort_by { |k, v| -v }
  return arr.first[0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  older.each do |k, v|
    if !newer.has_key?(k)
      older.delete(k)
    elsif v != newer[k]
      older[k] = newer[k]
    end
  end
  newer.each do |k, v|
    if !older.has_key?(k)
      older[k] = newer[k]
    end
  end
  return older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  letters = Hash.new(0)
  word.each_char do |char|
    letters[char] += 1
  end
  return letters
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  repeat = Hash.new(false)
  newArr = []
  arr.each do |c|
    if repeat[c] == false
      newArr << c
    end
    repeat[c] = true
  end
  return newArr
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  even_odd = Hash.new(0)
  numbers.each do |num|
    if num % 2 == 0
      even_odd[:even] += 1
    else
      even_odd[:odd] += 1
    end
  end
  return even_odd
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  vowels = "aeiou"
  count = Hash.new(0)
  str = string.chars.sort
  str.each do |c|
    if vowels.include?(c)
      count[c] += 1
    end
  end
  arr = count.sort_by {|k, v| -v}

  return arr.first[0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  arr = []
  list = students.select {|k, v| v > 6}
  list.each_with_index do |s1, i1|
    list.each_with_index do |s2, i2|
      if i2 > i1
        arr << [s1[0], s2[0]]
      end
    end
  end
  return arr
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  bio = Hash.new(0)
  specimens.each do |species|
    bio[species] += 1
  end
  pop = bio.values.sort
  return bio.keys.length ** 2 * pop.first / pop.last
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal = character_count(normal_sign)
  vandal = character_count(vandalized_sign)
  vandal.each do |k, v|
    if !normal.has_key?(k) || normal[k] < v
      return false
    end
  end
  return true
end

def character_count(str)
  count = Hash.new(0)
  arr = str.downcase.chars
  arr = arr.select {|c| c >= 'a' && c <= 'z'}
  arr.each do |c|
    count[c] += 1
  end
  return count
end
