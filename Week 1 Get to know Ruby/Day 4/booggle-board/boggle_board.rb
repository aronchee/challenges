class BoggleBoard

  def initialize

    # new_dice = []
    # @dice = ("A".."Z").to_a
    # new_dice = Array.new(4){@dice.sample(4)}
    
    @board = Array.new(4){Array.new(4)} #create 4x4 element
    
  end 
  
  def shake!

    @board.each_with_index do |x,x0| #do [a,b,c,d]
      x.each_with_index do |y,y0|
        @board[x0][y0] = ('A'..'Z').to_a.sample #randomize the alphabet in [a,b,c,d]
        if @board[x0][y0] == ('Q')
            @board[x0][y0] = ('Qu')
        end
      end

    end
    
  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  #
  # Override this to print out a sensible board format so
  # you can write code like:
  #
  # board = BoggleBoard.new
  # board.shake!
  # puts board

  def to_s
    @board.each do |row|
      puts row.join("  ")
    end  
  end

# print "#{letter}  " if letter != "Q"
#       print "Qu " if letter == "Q"
# print "\n" if (index + 1) % 4 == 0

end

board = BoggleBoard.new
board.shake!
board.to_s