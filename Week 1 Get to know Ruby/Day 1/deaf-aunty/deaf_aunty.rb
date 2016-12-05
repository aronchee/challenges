# Save this file to your computer so you can run it
# via the command line (Terminal) like so:
#   $ ruby deaf_aunty.rb
#
# Your method should wait for user input, which corresponds
# to you saying something to your Aunty.

# You'll probably want to write other methods, but this
# encapsulates the core Aunty logic
def deaf_aunty
	me = true

	while me
		say = gets.chomp
		
		if say == "I love ya, Aunty. I have to go now."
			puts "Byebye, love."
			break me = false
		elsif say == say.upcase
			puts "NO, WE CAN'T DO THAT!"
		else
			puts "HUH!? SPEAK UP, LOVE!"
		end
	end
end

# Run our method
deaf_aunty 