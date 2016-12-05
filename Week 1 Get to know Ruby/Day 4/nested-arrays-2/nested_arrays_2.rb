# Place your solutions here

def tic_tac_toe

	tic_tac_toe = [ ["X","X","O"],["O","X","O"],["O","O","X"]]
	xoxo = Array.new(3) {Array.new(3,"")}
	marks = ["X","O"]
	xoxo.each do |row|
		row.each_with_index do |element,index|
			row[index] = marks.sample
		end
	end
	xoxo
end

p tic_tac_toe




roster = [

	["Number", 	"Name",			    "Position",			"Points per Game"],
	["12",	  	"Joe Schmo",		"Center",			[14,32,7,0,23]],
	[" 9",   	"Ms.Buckets",		"Point Guard",		[19,0,11,22,0]],
	["31",   	"Harvey Kay",		"Shooting Guard",	[0,30,16,0,25]],
	["18",	  	"Sally Talls",		"Power Guard",		[18,29,26,31,19]],
	["22",		"MK DiBoux",		"Small Forward",	[11,0,23,17,0]]
		
	]

	def convert_roster_format(roster)

		hash = Hash.new
		key = roster.shift #key => titles => skip key element

		roster.map do |entry| 
			Hash[key.zip(entry)] #zip combine the column
		end
	end

converted_roster = convert_roster_format(roster)


p converted_roster[0]
p converted_roster[0]["Name"] == "Joe Schmo"
