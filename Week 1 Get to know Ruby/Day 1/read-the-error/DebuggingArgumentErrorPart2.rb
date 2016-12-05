def mean(*numbers)
  sum = numbers.inject(:+)
  
  return sum / numbers.length
end

#Instead of changing the method invocation, change the definition.
#In other words, rewrite the method so that it can take any number of arguments.
sample_avg = mean(5, 3, 6, 10)
puts sample_avg
#comment out the above code with your new solution