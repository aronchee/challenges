2.3.1 :001 > def say_hi
2.3.1 :002?>   puts "Hello, your name is:"
2.3.1 :003?>   name = gets.chomp
2.3.1 :004?>   puts "Welcome, #{name}."
2.3.1 :005?>   end
 => :say_hi 
2.3.1 :006 > clear
NameError: undefined local variable or method `clear' for main:Object
Did you mean?  caller
	from (irb):6
	from /home/nextacademy/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
2.3.1 :007 > say_hi
Hello, your name is:
Aron
Welcome, Aron.
 => nil 
2.3.1 :008 > Time.now
 => 2016-09-05 13:57:16 +0800 
2.3.1 :009 > Math.sqrt(1282)
 => 35.805027579936315 
2.3.1 :010 > Array.new(10,'bee')
 => ["bee", "bee", "bee", "bee", "bee", "bee", "bee", "bee", "bee", "bee"]