class RPNCalculator

  def evaluate(string)
  	expression_string = string.split
        operands = []

        if expression_string.length == 1
            evaluation = expression_string
        end

        expression_string.each do |i|
            if i.match(/[0-9]/) != nil
                operands.push(i)
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

  def sum(calculator)
      result = 0
      calculator.each do |i|
            result += i.to_i
      end
      result
  end

  def product(calculator)
      result = 1
      calculator.each do |i|
            result *= i.to_i
      end
      result
  end

  def difference(calculator)
      if calculator.length < 2
          0
      else
         calculator[0].to_i - calculator[1].to_i
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

# string_1 = ARGV[0]
# string_2 = ARGV[1]
# puts ARGV.inspect
# p ARGV.class