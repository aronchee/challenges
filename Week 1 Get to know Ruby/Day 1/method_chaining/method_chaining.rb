# TODO: Refactor for elegance
def shout_backwards(string)
  #all_caps  = string.upcase
  result = string.upcase.reverse + "!!!" #edited one lined code
  #backwards = all_caps.reverse
  #result = backwards + "!!!"
  return result
end


# FIXME: This is convoluted. Refactor for clarity.
def squared_primes(array)

	prime = []
	array.each do |x| 
		if (2..x-1).all? {|i| x % i != 0} #use .all to get the x then x divide i must not equal 0
			prime<<x
		end
	end
	prime.map{|p| p*p}


  #array.find_all{|x| (2..x-1).select(){|i| x % i == 0 }.count == 0 }.map{|p| p*p}
end

# Driver code... don't edit. This should print a bunch of trues.
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]