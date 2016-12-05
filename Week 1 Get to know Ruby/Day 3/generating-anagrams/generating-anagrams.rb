# Place your solutions here
def anagrams_for(word,dictionary)
	words = []
	letter = word.downcase.split("").sort
	letter.permutation {|w| words<<w.join}
	words.select {|w| dictionary.include?(word)}
end

dictionary = ['acres','cares','Cesar','races','smelt','melts','etlsm']
p anagrams_for('acres',dictionary)

