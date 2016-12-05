def dictionary_sort
  # Your code here to sort the array
	inputs = [] #create a new empty array
	p "Type a word:"
	input = gets.chomp.downcase #get input and lower the case

	while input != "" #when input is not blank
		inputs << input
		p "Type another word (or press enter to finish):"
		input = gets.chomp.downcase
	end

	if input == "" #initial when input is blank
		p "All right. Your dictionary has #{inputs.count} word(s):"
		p inputs.sort
	end

end

# ...your code here to initialize the program and take user input

# puts "Enter a word:"
# arr = gets.chomp
# a = 0

# while a != 0
# 	puts "Type another word (or press Enter to end):"
# 	input = gets.chomp
# 	if input.empty?
# 		a += 1
# 	else 
# 		arr << input
# 	end
# end

# loop do 
# 	puts "enter a word again:"
# 	input = gets.chomp
# 	break if input == ""

# 	if input.is_a? Numeric
# 		puts "enter only word:"
# 	else
# 		inputs << input
# 	end
# end

# result = dictionary_sort()
# puts "Congratulations! Your dictionary has #{result.length} words."
# puts result.sort.inspect

dictionary_sort #call method
