
# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here

class Cookies
	attr_reader :selection
	
	def initialize
		@selection = {1 => "Chocolate-Chip", 2 => "Oat & Rasin", 3 => "Butter"}
		@tray = []
	end

	def menu #to show the menu for cookies
		@selection.each do |number, type|
			puts "#{number}. #{type} Cookies"
		end
	end

	def choose_cookie(number) #method to select a cookie type
		@selection.each do |n, type|
			if number == n
				puts "#{type} Cookies!"
			end
		end
	end

	def put_in_oven(cookie_quantity) #method to insert the amount of cookie but cannot more than 15
		while cookie_quantity > 15
			puts "You won't fit so many cookies in the oven! Choose different amount:"
			cookie_quantity = gets.chomp.to_i
		end
		@tray.push(cookie_quantity) #push the quantity into the tray array
	end

end

class Oven < Cookies
	
	def bake!
		if @tray.empty? == true #if tray is not empty
		 	puts "Set up the timer"
		else
		 	puts "Hey, cookies?" #tray is empty
		end
	
		def timer
			puts "How long would you like to bake the cookies? Cautious: Know your cookies time!"
			time = gets.chomp.to_i
			for count in (time).downto(0) #timer countdown for oven to 0
				sleep(0.5)
				puts count
				if count == time - 20
					puts "Your cookies are burned!"
				elsif count == time - 15
					puts "Your cookies are ready!"
				elsif count == time - 10
					puts "Your cookies are almost ready!"
				elsif count == time - 5
					puts "Your cookies are doughy!"
				end
			end
		end
	
	end

end

puts "-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-"
puts "♥------------------------------♥"
puts "♥-♥---THIS IS RUBY BAKERY!---♥-♥"
puts "♥------------------------------♥"
puts "-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-♥-"
puts "We've got:"
cookies = Cookies.new
cookies.menu

puts "♥-----------------------------♥"
puts "Select a cookie would you like to bake? Please select a number:"
choice = gets.chomp.to_i
cookies.choose_cookie(choice)
puts "How many of them would you like to bake?"
number_of_cookies = gets.chomp.to_i
cookies.put_in_oven(number_of_cookies)
new_cookies = Oven.new
new_cookies.bake!
new_cookies.timer 