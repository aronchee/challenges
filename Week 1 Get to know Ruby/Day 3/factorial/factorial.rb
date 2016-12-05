# Implement an iterative version of the factorial function
def factorial_iterative(n)
	(1..n).inject(1) {|a,b| a*b} 
	#the inject "1" initial value allow it to work on 0
end

# Implement a recursive version of the factorial function
def factorial_recursive(n)
	n<1 ? 1 : factorial_recursive(n-1)*n 
	#n<1 if condition is false then execute factorial_recursive
end

puts factorial_recursive(9) == 362880