# Place your answer here
require 'byebug'
def pig_latin_word(word)
  unless word =~ /^[aeiou]/
    latin_word = word.sub(/^([^aeiou]+)(.+)/) { $2 + $1 + 'ay'  } #any word except for 'aeiou' will be cut off as $1 
    #the (/^([aeiou]+)(.+)/) will cut the beginning of the word without aeiou until it locate the first aeiou.
  end
  latin_word
end

def pig_latin(sentence)
  words = (sentence.is_a? String) ? sentence.split(' ') : sentence
  words.map! { |word| pig_latin_word(word) }
  puts words.join(' ')
end

p pig_latin_word('chppampion')

p pig_latin('do you know me?')