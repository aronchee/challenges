require_relative 'app'

# cohort = Cohort.find(1)
# cohort[:name] = 'Best Cohort Ever'
# cohort.save

p Cohort.find(1)[:name] == 'Best Cohort Ever'