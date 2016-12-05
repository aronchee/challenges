# Objective 2: Chessboard
chessboard = Array.new

chessboard = [

			 ["B_R","B_K","B_B","B_Q","B_K","B_B","B_K","B_R"],

			 ["B_P","B_P","B_P","B_P","B_P","B_P","B_P","B_P"],

			 [         						 				 ],

			 [								 				 ],

			 [												 ],

			 [								 				 ],

			 ["W_P","W_P","W_P","W_P","W_P","W_P","W_P","W_P"],

			 ["W_R","W_K","W_B","W_Q","W_K","W_B","W_K","W_R"]

			]

puts chessboard[7][0] == "W_R"


# Objective 3: Data tableS

table = Array.new

table = [

	["Number", 	"Name",			    "Position",			"Points per Game"],
	["12",	  	"Joe Schmo",		"Center",			[14,32,7,0,23]],
	[" 9",   	"Ms.Buckets",		"Point Guard",		[19,0,11,22,0]],
	["31",   	"Harvey Kay",		"Shooting Guard",	[0,30,16,0,25]],
	["18",	  	"Sally Talls",		"Power Guard",		[18,29,26,31,19]],
	["22",		"MK DiBoux",		"Small Forward",	[11,0,23,17,0]]
		
	]

puts table[3][2] == "Shooting Guard"
puts table[1][3] == [14,32,7,0,23]