#  Write a method same_char_collapse that takes in a string and returns a collapsed version of 
#  the string. To collapse the string, we repeatedly delete 2 adjacent characters that are the 
#  same until there are no such adjacent characters. If there are multiple pairs that can be 
#  collapsed, delete the leftmost pair. For example, we take the following steps to collapse 
#  "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

def same_char_collapse(str)
  collapsible = true
  while collapsible
    collapsible = false
	chars = str.split("")
  	chars.each.with_index do |char, idx|
      if chars[idx] == chars[idx + 1]
	    chars[idx] = ""
	    chars[idx + 1] = ""
	    collapsible = true
	    break
	  end
    end
	str = chars.join("")
  end
  return str
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv


