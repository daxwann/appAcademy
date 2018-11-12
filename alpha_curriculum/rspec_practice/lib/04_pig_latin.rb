def translate(str)
  newArr = []
  str.split(" ").each do |word|
    newArr << pigify(word.chars)
  end
  return newArr.join(" ")
end

def pigify(arr)
  #find first vowel
  vowels = "aeio"
  newArr = []
  arr.each_with_index do |c, i|
    if vowels.include?(c) || (c == 'u' && arr[i-1] != 'q')
      newArr = arr.drop(i) << arr.take(i)
      break
    end
  end
  return newArr.join + "ay"
end
