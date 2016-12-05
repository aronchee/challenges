# Place your solutions here
def global_scope
	local_var = 1
	# return local_var
end
def global_scope 
	get_local_var = 2
end
# p get_local_var
p global_scope #it will print out the get_local_var = 2 instead of local_var = 1

##################

class BasicClass

	def get_instance_var
		return instance_var
	end

	def instance_var
		@instance_var 
	end

	def global_scope 
		get_local_var = 2
	end

end

var = BasicClass.new
p var.global_scope #it will call out the global_scope method

p var.get_instance_var #it will call out the get_instance_var and return nil because @instance_var has no value.

############

class BasicClass1

	def get_instance_var1
		return instance_var1
	end

	def instance_var1
		@instance_var1
	end

	def set_instance_var(thing)
		@instance_var2 = thing
	end

end

var1 = BasicClass1.new

p var1.set_instance_var(3) #print out instance_var2 = 3 setters!

p var1.get_instance_var1 #print out instance_var1 = nil getters!

class MyCoolClass

	def self.some_method
		"quack"
	end
end

p MyCoolClass.some_method

#######

class BasicClass2

	@@class_var = "Huh???"

	def set_instance_var1(arg)
		@instance_var3 = arg
	end

	def get_instance_var2
		@instance_var3 = 3
	end

	def self.class_var(x)
		@@class_var = x
	end

end

var2 = BasicClass2.new

p var2.set_instance_var1(2) #print out set number (2) 

p var2.set_instance_var1("Hello") #print out set number ("Hello") => can set anything on it.

p var2.get_instance_var2 #getter => set a number for it to read

p var2.get_instance_var2



