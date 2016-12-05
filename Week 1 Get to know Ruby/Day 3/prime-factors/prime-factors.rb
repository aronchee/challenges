# Place your solutions here
# def prime_factors(number, array = [])
#   return if number == 1
#   2.upto(number).each do |num|
#     if number % num == 0
#       number /= num
#       array << num
#     else
#     end
#   end
#   prime_factors(number, array)
# end

def prime_factor(num)
	
	(1..num).select {|n| (num % n).zero?}
	#zero? will return true when num has zero
end

puts prime_factor(20)