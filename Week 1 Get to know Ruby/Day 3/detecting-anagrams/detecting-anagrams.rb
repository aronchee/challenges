# Place your solution here
def canonical(word)
	word.downcase.split("").sort
end

def is_anagram?(word1,word2)
	canonical(word1) == canonical(word2)
end

puts is_anagram?("cinEma","icEmAn")
puts is_anagram?("ice","water")