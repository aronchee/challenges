# Place your pig latin solution here
class PigLatin

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

end

# Place your RPN calculator solution here
class RPNCalculator

  def evaluate(string)
  	expression_string = string.split
        operands = []

        if expression_string.length == 1
            evaluation = expression_string
        end

        expression_string.each do |i|
            if i.match(/[0-9]/) != nil #when any digit matched
                operands.push(i) #i push into the operands = []
            elsif i == "+"
                operands.push(sum(operands.pop(2)))
            elsif i == "*"
                operands.push(product(operands.pop(2)))
            elsif i == "-"
                operands.push(difference(operands.pop(2)))
            end
        end
        puts operands
  end

  def sum(calculate)
      result = 0
      calculate.each do |i|
            result += i.to_i
      end
      result
  end

  def product(calculate)
      result = 1
      calculate.each do |i|
            result *= i.to_i
      end
      result
  end

  def difference(calculate)
      if calculate.length < 2
          0
      else
         calculate[0].to_i - calculate[1].to_i
      end
  end

end

calc = RPNCalculator.new

puts calc.evaluate('1 2 +')   # => 3
puts calc.evaluate('2 5 *')   # => 10
puts calc.evaluate('50 20 -') # => 30

# The general rule is that 'A B op' is the same as 'A op B'
# i.e., 5 4 - is 5 - 4.
puts calc.evaluate('70 10 4 + 5 * -') # => 0