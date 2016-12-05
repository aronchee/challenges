require 'byebug'

class Sudoku
  def initialize(board_string)
  	# byebug 
	@board = board_string.split("").each_slice(9).to_a #create the sudoku board
	create_hash #go to method create_hash
  end

  def create_hash
    @hash = Hash.new {|k,v| k[v]=[]}
    (0...9).each do |row|
      (0...9).each do |col|
        key = "#{row/3}#{col/3}" #dividing with 3==>9 groups of elements sharing same index NEW X and NEW Y
        @hash[key] << @board[row][col] #the array from initialize is put in @hash
      end
    end
  end

  def solve!
  	solved = false

    until solved
      @board.each_with_index do |row, x|
        row.each_with_index do |col, y|
          if col == "0"
            if all_possible_solutions(x, y).count == 1
              @board[x][y] = all_possible_solutions(x, y)[0]
              solved = true if @board.flatten.index("0") == nil 
              #flatten..for every element that is an array, extract its elements into the new array.
            end
          end
        end
      end
    end
  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board
  	count = 0
    while count < 9
        @board.each do |row|
            if count % 3 == 0
                puts "---------------------"
            end
            #print nice nice
            puts "#{row[0]} #{row[1]} #{row[2]} | #{row[3]} #{row[4]} #{row[5]} | #{row[6]} #{row[7]} #{row[8]}"
            count += 1
        end
    end
	puts "---------------------"
  end

	
  def scan_row(row) #return all the numbers not used in that column
    @possible_solutions_row = []
    (1..9).each do |i|
        if @board[row].include?(i.to_s) == false
          @possible_solutions_row << i.to_s
        end
    end
    @possible_solutions_row
  end

  def scan_col(col) #return all numbers not used in that column
    @possible_solutions_col = []
    @board_transposed = @board.transpose
    (1..9).each do |i|
        if @board_transposed[col].include?(i.to_s) == false
          @possible_solutions_col << i.to_s
        end
    end
    @possible_solutions_col
  end

  def scan_box(row, col) #return all numbers not used in that box
    @possible_solutions_box = []
    key = "#{row/3}#{col/3}"
    (0..9).each do |i|
      if @hash[key].include?(i.to_s) == false
        @possible_solutions_box << i.to_s
      end
    end
    @possible_solutions_box
  end

  def all_possible_solutions(row,col)
    (scan_row(row) & scan_col(col)) & scan_box(row,col)
  end

end
# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
game.solve!

puts game.board