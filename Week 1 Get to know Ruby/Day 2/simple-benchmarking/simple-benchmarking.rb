def benchmark
  # Your benchmarking code goes here.
  t0=Time.now
  yield
  t1=Time.now
  t1-t0
end

# Be careful, pasting this into IRB will take a long time to print.
# It's a loooong string. :)
long_string = "apple"*100000000

running_time = benchmark { long_string.reverse }

puts "string.reverse took #{running_time} seconds to run"