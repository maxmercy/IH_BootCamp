module ConvertCoord
  # ex b6 => [5,1]
  def convert_position_to_array(position)
		coordinate = position.chars
		temp = coordinate[0]
		x = coordinate[1]
		x = (8 - position[1].to_i )
		convert_y = { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6 , h: 7 }
		y= convert_y.values_at(temp.to_sym)
		coordinate[0]=x
		coordinate[1]= y[0]
		position_array = coordinate
	end
end


module Validator
  def piece_color(piece)
		if piece.piecename.include? "w" then @color = "white" else @color = "black" end
	end

	#check if color are similar return true if different colors
	def color_check
		piece_color(@piece_at_origin) != piece_color(@piece_at_destination)
	end

	#return true if ok
  def destination_color
    if @piece_at_destination != nil
      if color_check then true else false end
    else true  end
  end

  #return true if empty between the two position
  def path_validator_horizontal_vertical
    validity = false
    if @position_origin[0] == @position_destination[0]
      validity = horizontal_check
    elsif @position_origin[1] == @position_destination[1]
      validity = vertical_check
    else validity = false
    end
    validity
  end

  def horizontal_check
    if @position_origin[1] < @position_destination[1]  then i = @position_origin[1] + 1 else i = @position_origin[1] - 1  end
    until i == (@position_destination[1])
      if @board[@position_origin[0]][i] != nil then validity= false else validity = true end
      if @position_origin[1] < @position_destination[1] then  i += 1 else i -= 1  end
    end
    validity
  end
  def vertical_check
  if @position_origin[0] < @position_destination[0] then i = @position_origin[0] + 1 else  i = @position_origin[0] - 1 end
   until i == (@position_destination[0])
    if @board[i][@position_origin[1]] != nil then validity= false else validity = true end
    if @position_origin[0] < @position_destination[0] then  i += 1 else  i -= 1  end
  end
  validity
end



  def path_validator_diagonal
      test = []
     if @piece_at_origin.diagonal_direction(@position_origin,@position_destination)
      i = j = 1
      if @position_origin[0] > @position_destination[0]
        diag_x = @position_origin[0] - 1
        i = (-1)
      else
        diag_x = @position_origin[0] + 1
        i = (+1)
      end
      if @position_origin[1] > @position_destination[1]
        diag_y = @position_origin[1] - 1
        j = (-1)
      else
        diag_y = @position_origin[1] + 1
        j = (+1)
      end
      until diag_x == (@position_destination[0])
        if @board[diag_x][diag_y] != nil
          test << false
        end
        diag_y += j
        diag_x += i
      end
    end
    test.length == 0
  end



end
# if the_board.board[@position_origin[0]][@position_origin[1]].piecename == ("wK" || "bK")
#   if  (@position_origin[0] - @position_destination[0]) > 1 || (@position_origin[0] - @position_destination[0]) < -1
#     validity = false
#   end
# end




module PrintBoard
  #need board define
  def print_board
		puts "**********************************"
		puts "|   ♔ ♚ ♕ ♛ ♖ ♜ ♗ ♝ ♘ ♞ ♙ ♟      |"
		puts "|        Actual board            |"
		puts "|   ♔ ♚ ♕ ♛ ♖ ♜ ♗ ♝ ♘ ♞ ♙ ♟      |"
		puts "**********************************"
		@board.each_index do |i|
			@board[i].each_index do |y|
				if y == 0
					print "   #{8 - i}"
				end
				if @board[i][y] == nil
					print "#{@board[i][y]} --"
				else
					print  " #{@board[i][y].piecename}"
				end
			end
			puts "\n"
		end
		puts "      a  b  c  d  e  f  g  h"
		puts "\n\n\n\n"
	end
end



module SetBoard
  #direct from input with position to the format b3 / a5 ...
  def add_piece(piece,position)
    position_grille = convert_position_to_array(position)
    x = position_grille[0]
    y = position_grille[1]
    @board[x][y] = piece
    @coordinate = [x,y]
  end





end
