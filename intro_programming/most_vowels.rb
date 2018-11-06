#  Write a method most_vowels that takes in a sentence string and 
#  returns the word of the sentence that contains the most vowels.

def most_vowels(sentence)
  vowels = "aeiou"
  vowelCount = Hash.new(0);
  sentence.split(" ").each do |word|
    word.each_char do |char|
      if vowels.include?(char)
        vowelCount[word] += 1
      end
    end
  end
  sortedArr = vowelCount.sort_by { |k, v| v}
  return sortedArr[-1][0]
end

print most_vowels("what a wonderful life") #=> "wonderful"

