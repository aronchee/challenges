# Write your code here!
class Animal
	def species
		puts "We are animal."
	end
end

class Mammal < Animal
	def breathe
		puts "inhale and exhale"
	end
end

class Amphibian < Animal
	def cold
		puts "i am attracted to heat"
	end
end

class Primate < Mammal
	def blood
		puts "They are warm-blooded"
	end
end

class Frog < Amphibian
	def num_legs
		puts "Has 4 legs"
	end
end

class Bat < Mammal
	def num_legs
		puts "Has 2 legs"
	end
end

class Chimpanzee < Primate
	def num_legs
		puts "Chimpanzee has 2 legs" 
	end
end

monkey = Chimpanzee.new
monkey.num_legs
monkey.blood
monkey.breathe
monkey.species
monkey.cold #error because undefined method for class Chimpanzee
