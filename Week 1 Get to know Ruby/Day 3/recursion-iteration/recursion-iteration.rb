# Place your solutions here
require 'benchmark'

def fibonacci_iterative(n)
	a = 0
	b = 1
	puts "0: #{a}"
	10.times do |n|
		puts "#{n+1}: #{b}"
		a, b=b, a+b #
	end
end

def fibonacci_recursive(n)

	return 0 if n == 0
  	return 1 if n == 1
	fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)

end

# puts fibonacci_iterative(0)
# puts fibonacci_recursive(10)
puts Benchmark.measure {fibonacci_iterative(10)*1000}
puts Benchmark.measure {fibonacci_recursive(10)*1000}