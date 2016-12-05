# Place your solutions here
def linear_search(number,random_numbers)
	i=0
	until random_numbers[i] == number || random_numbers[i] == nil
		i+=1
	end
	random_numbers[i] == number ? i : nil
end

def global_linear_search(number,random_numbers)
	i=0
	result=[]
	while i<random_numbers.length
		result<<i if random_numbers[i] == number
		i+=1
	end 
	result
end


random_numbers = [6,29,18,2,72,19,18,10,37]

puts linear_search(2, random_numbers)

puts global_linear_search(6, random_numbers)