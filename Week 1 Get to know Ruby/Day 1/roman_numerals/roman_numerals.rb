def to_roman(num)
  # Your code here
	
		m = num / 1000
		print "M" * m
		m_rem = num % 1000
		d = m_rem / 500
		print "D" * d
		d_rem = num % 500
		c = d_rem / 100
		print "C" * c
		c_rem = num % 100
		l = c_rem / 50
		print "L" * l
		l_rem = num % 50
		x = l_rem / 10
		print "X" * x
		x_rem = num % 10
		v = x_rem / 5
		print "V" * v
		v_rem = num % 5
		i = v_rem / 1
		print "I" * i
	
end

# Drive code... this should print out trues.

puts to_roman(1) == "I"
puts to_roman(3) == "III"
puts to_roman(6) == "VI"

# TODO: what other cases could you add to ensure your to_roman method is working?