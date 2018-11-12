#echo
def echo(str)
  return str
end

#shout
def shout(str)
  return str.upcase
end

#repeat
def repeat(str, num=2)
  newStr = str
  (num - 1).times { newStr += " #{str}" }
  return newStr
end

#start of word
def start_of_word(str, num)
  return str[0...num]
end

#first_word
def first_word(str)
  return str.split(" ")[0]
end

#titleize
def titleize(str)
  newArr = []
  little_words = ["or", "and", "the", "over"]
  str.split(" ").each.with_index do |word, i|
    if i == 0
      newArr << word.capitalize
    elsif little_words.include?(word)
      newArr << word
    else
      newArr << word.capitalize
    end
  end
  return newArr.join(" ")
end
