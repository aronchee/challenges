# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree
  # Ages the tree one year
  basket = []
  attr_reader :age
  attr_reader :height
  attr_reader :orange

  def initialize 
    @age = 0
    @height = 0
    @orange = []

  def age!
      @age += 1 
      @height += 0.5
      rand(1..10).times{@orange<<Orange.new(rand(2.5..3.0))}
  end

  def dead?
    if @age == 20
      return true
    end
  end

#   # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    orange.length > 0
  end

#   # Returns an Orange if there are any
#   # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    if self.any_oranges? == true
      @orange.pop #randomly take value from the @orange
    end
    # orange-picking logic goes here
  end
end

class Orange
#   # Initializes a new Orange with diameter +diameter+
attr_reader :diameter
  def initialize(diameter)
    @diameter = diameter
  end
end

tree = OrangeTree.new

# tree.age!
# p tree.age
# p tree.height
# p tree.dead?
# p tree.any_oranges?
# p tree.fruity

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall."

until tree.dead?
  basket = []

  while tree.any_oranges?
    
    basket << tree.pick_an_orange!
  
  end

  sum = 0

  basket.each {|o|sum += o.diameter}

  avg_diameter = sum / basket.size

  puts "Year #{tree.age} Report"

  puts "Tree height: #{tree.height} feet"

  puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"

  puts ""

  tree.age!

end

end
puts "Alas. The tree is dead."
