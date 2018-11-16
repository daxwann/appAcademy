def reverser(&code)
  reversed = []
  reversed = code.call.split(" ").map do |word|
    word.reverse
  end
  return reversed.join(" ")
end

def adder(nb = 1, &code)
  code.call + nb
end

def repeater(n = 1, &code)
  n.times &code
end
