def fibonacci_iterative(n)
	a = 0
	b = 1
	puts "0: #{a}"
	10.times do |n|
		puts "#{n+1}: #{b}"
		a, b=b, a+b 
	end
end

puts fibonacci_iterative(0)

# def fibonacci_iterative(n)
#   array = [0,1]
#   until (array.length - 1) >= n
#     array << (array[-1] + array[-2])
#   end
#   array[n]
# end

def fibonacci_recursive(n)

	return 0 if n == 0
  	return 1 if n == 1
	fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)

end

puts fibonacci_recursive(10)