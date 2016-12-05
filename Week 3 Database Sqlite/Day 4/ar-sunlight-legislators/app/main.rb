require_relative '../db/config'
require_relative 'models/legislators.rb'
require_relative 'models/representive.rb'
require_relative 'models/senator.rb'
require_relative '../lib/sunlight_legislators_importer'

def legislator_state(string)
	senators = Senator.state(string)
		print "Senators:"
	sens = Senator.where(state: state).order(lastname: lastname)
	sens.each do |sen|
		puts " #{sen[:firstname]} #{sen[:lastname]} #{sen[:party]}"
	end

	representatives = Representative.state(string)
		print "Representatives:"
	reps = Representative.where(state: state).order(lastname: lastname)
	reps.each do |rep|
		puts " #{rep[:firstname]} #{rep[:lastname]} #{rep[:party]}"
	end
end