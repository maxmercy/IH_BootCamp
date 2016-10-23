class Piece
	attr_reader :color, :coordinate
	def initialize
		@color
		@coordinate = []
	end

	#return @color = white or black
	def piece_color(piece) 
		list_white_piece = ["wP", "wR", "wN", "wB", "wQ", "wK"]
		
		if list_white_piece.include?(piece.piecename) 
			@color = "white" 
		else
			@color = "black"
		end
	
	end	

	#check if color are similar return true if different colors
	def color_check(piece_at_origin,piece_at_destination)
		
		if piece_color(piece_at_origin) != piece_color(piece_at_destination)
			#puts "NOT VALID, Origin and destination pieces' colors are identical."
			bol = false
			puts "Color Differente"
		else
			bol = true
			puts "Color Identique"
		end
		
		bol
	
	end

	#return true if ok
	def horizontal_direction(origin_arr,destination_arr)	# ## check direction
		if origin_arr[0] == destination_arr[0] || origin_arr[1] == destination_arr[1]
			true 
		else
			#puts "NO VALID, invalid Direction"
			false
		end
	end

	#return true if ok
	def diagonal_direction(origin_arr,destination_arr)
		dif_x = destination_arr[0]	- origin_arr[0]
		dif_y = destination_arr[1]	- origin_arr[1]
		if dif_x == dif_y || dif_x == -dif_y
			true
		else
			false
		end
	end


	#check if destination empty, return true if something
	def check_if_destination_empty(the_board,destination_arr)
		if the_board.position_status(destination_arr) == false
			false
		else 
			true
		end
	end
	#return true if empty between the two position
	def path_validator_horizontal_vertical(the_board,origin_arr,destination_arr)
		validity = true 
		#puts "Starting Position #{origin_arr}, final position #{destination_arr}"

		if origin_arr[0] == destination_arr[0]
			#puts "Horitzontal direction"	
			if origin_arr[1] < destination_arr[1]
				i = origin_arr[1] + 1
			else 
				i = origin_arr[1] - 1	
			end
			until i == (destination_arr[1])
				if the_board.board[origin_arr[0]][i] != nil					
					#puts "Not VALID, A piece at the position [[#{origin_arr[0]}],#{[i]}] was FOUND."		 
					validity = false		 
				end
				if origin_arr[1] < destination_arr[1]
					i += 1
				else 
					i -= 1
				end		
			end

		else 
			#puts "Vertical direction"	
			if origin_arr[0] < destination_arr[0]
			 	i = origin_arr[0] + 1
			 else 
			 	i = origin_arr[0] - 1	
			 end
			 until i == (destination_arr[0])
			 	if the_board.board[i][origin_arr[1]] != nil					
			 		#puts "Not VALID, A piece at the position [#{[i]},[#{origin_arr[1]}]] was FOUND."		 					
					validity = false	
				else
					validity = true			
			 	end
			 	if origin_arr[0] < destination_arr[0]
					i += 1
			 	else 
			 		i -= 1
			 	end		
			end
		end
		validity
	end

	def path_validator_diagonal(the_board,origin_arr,destination_arr)
		validity = false
		diag_x = origin_arr[0] + 1  
		diag_y = destination_arr[1] + 1		
		i = j = 1	
		if origin_arr[0] > destination_arr[0]
			diag_x = diag_x - 2
			i = (-1)				
		end
		if origin_arr[1] > destination_arr[1]
			diag_y = diag_y - 2
			j = (-1)
		end		
		until diag_x == (destination_arr[0])  
			if the_board.board[diag_x][diag_y] != nil					
				#puts "Not VALID, A piece at the position [[#{origin_arr[0]}],#{[i]}] was FOUND."		 
				validity = false
			#	puts "#{the_board.board[diag_x][diag_y]}"
			else
				validity = true
			#	puts "#{the_board.board[diag_x][diag_y]}"
			end
			diag_x += i
			diag_y += j
		end	
		
		if the_board.board[origin_arr[0]][origin_arr[1]].piecename == ("wK" || "bK")
			if  (origin_arr[0] - destination_arr[0]) > 1 || (origin_arr[0] - destination_arr[0]) < -1
				validity = false
			end
		end



		
		validity
	end



	def valid_move(the_board,origin_arr,destination_arr)
		puts "\nYou want to move from #{origin_arr} to #{destination_arr}"
		if origin_arr.is_a? String
		origin_arr = the_board.convert_position_to_array(origin_arr)
		destination_arr = the_board.convert_position_to_array(destination_arr)
		end
		piece_at_destination = the_board.board[destination_arr[0]][destination_arr[1]]
		piece_at_origin = the_board.board[origin_arr[0]][origin_arr[1]]
		checker = true
		case 
		when check_direction(origin_arr,destination_arr) == false
			checker = false
		when (check_if_destination_empty(the_board,destination_arr) == true)  && (color_check(piece_at_origin,piece_at_destination) == true )
			checker = false			
		when path_validator(the_board,origin_arr,destination_arr) == false
			checker = false			
		end
		if checker == true 
			puts "VALID MOUVEMENT"  
		else 
			puts "INVALID MOUVEMENT"
		end
	end
end


class Rock < Piece
	attr_reader :color, :piecename
	def initialize(name)
		@color
		@piecename = name
	end

	#check if movement valid (rock horizontal / vertical )
	def check_direction(origin_arr,destination_arr)
		 horizontal_direction(origin_arr,destination_arr) 
	end

	#check the case between
	def path_validator(the_board,origin_arr,destination_arr)
		path_validator_horizontal_vertical(the_board,origin_arr,destination_arr)
	end

end


class Queen < Piece
	attr_reader :color,:piecename
	def initialize(name)
		@color
		@piecename = name
	end

	#check if movement valid (horizontal / vertical Or Diagonal)
	def check_direction(origin_arr,destination_arr)
		 horizontal_direction(origin_arr,destination_arr) || diagonal_direction(origin_arr,destination_arr)
	end


	#check the case between
	#	check the case between
	def path_validator(the_board,origin_arr,destination_arr)		
		if horizontal_direction(origin_arr,destination_arr)
			validity = path_validator_horizontal_vertical(the_board,origin_arr,destination_arr)
		elsif diagonal_direction(origin_arr,destination_arr)	
			validity = path_validator_diagonal(the_board,origin_arr,destination_arr)
		end
		validity
	end
end

class Beeshop < Piece
	attr_reader :color,:piecename
	def initialize(name)
		@color
		@piecename = name
	end

	#check if movement valid (horizontal / vertical Or Diagonal)
	def check_direction(origin_arr,destination_arr)
		diagonal_direction(origin_arr,destination_arr)
	end


	#check the case between
	#	check the case between
	def path_validator(the_board,origin_arr,destination_arr)		
		path_validator_diagonal(the_board,origin_arr,destination_arr)
	end

end

class King < Piece
	attr_reader :color,:piecename
	def initialize(name)
		@color
		@piecename = name
	end

	#check if movement valid (horizontal / vertical Or Diagonal)
	def check_direction(origin_arr,destination_arr)
		 horizontal_direction(origin_arr,destination_arr) || diagonal_direction(origin_arr,destination_arr)
	end


	#check the case between
	#	check the case between
	def path_validator(the_board,origin_arr,destination_arr)		
		if horizontal_direction(origin_arr,destination_arr)
			validity = path_validator_horizontal_vertical(the_board,origin_arr,destination_arr)
		elsif diagonal_direction(origin_arr,destination_arr)	
			validity = path_validator_diagonal(the_board,origin_arr,destination_arr)
		end
		validity
	end

end