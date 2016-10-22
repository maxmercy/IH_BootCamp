require "pry"
require_relative "pieces"


class Cheeseboard
	attr_accessor :board 
	def initialize
		@board = []
		@coordinate = []
	end

	def create_board
		8.times do @board << [nil,nil,nil,nil,nil,nil,nil,nil]
		end
	end

	#### convert position bord in array ie: a1 -> [0,7] !!! coordinatearray up/down!!!
	def convert_position_to_array(position)
		@coordinate = position.chars
		temp = @coordinate[0]
		x = @coordinate[1]
		x = (8 - position[1].to_i )
		convert_y = { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6 , h: 7 }
		y= convert_y.values_at(temp.to_sym)
		@coordinate[0]=x
		@coordinate[1]= y[0]
		position_array = @coordinate
	end

	#### print board with all piece if there is
	def print_board
		puts "**********************************"
		puts "|   ♔ ♚ ♕ ♛ ♖ ♜ ♗ ♝ ♘ ♞ ♙ ♟      |"
		puts "|        Actual board            |"
		puts "|   ♔ ♚ ♕ ♛ ♖ ♜ ♗ ♝ ♘ ♞ ♙ ♟      |"
		puts "**********************************"
		@board.each_index do |i|
			@board[i].each_index do |y|
				if y == 0 
					print 8 - i
				end

				if @board[i][y] == nil 
					print "#{@board[i][y]} [_]"
				else 
					print  " #{@board[i][y]} "
				end

			end
			puts "\n"
		end	
		puts "   a   b   c   d   e   f   g   h"
		puts "\n\n\n\n"
	end

	#add a piece on the bord
	def add_piece(piece,position)
		position_grille = convert_position_to_array(position)
		x = position_grille[0]
		y = position_grille[1]
		@board[x][y] = piece
	end


	#check the position status
	def position_status(position)

		if position.is_a? String
			position_grille = convert_position_to_array(position)
		else position_grille = position
		end
		
		x = position_grille[0]
		y = position_grille[1]
		

		if @board[x][y] == nil
			#puts "At the position #{position}, there is nothing"
			false
			
		else
			#puts "At the position #{position}, there is a #{@board[x][y]}"

			true
		end
	end



	# def checkmove(piece,origin,destination)
	# 	origin_array = convert_position_to_array(origin)
	# 	desctination_array = convert_position_to_array(destination)

	# 	#piece.valid_move(@board, origin_array, desctination_array)

	# end

end




mycheeseboard = Cheeseboard.new

mycheeseboard.create_board

mycheeseboard.add_piece(:wQ, "a1")
mycheeseboard.add_piece(:wQ, "e1")
mycheeseboard.add_piece(:wQ, "a5")
mycheeseboard.add_piece(:bQ, "e5")
mycheeseboard.add_piece(:bQ, "c8")

mycheeseboard.print_board

# mycheeseboard.position_status("a8")
# mycheeseboard.position_status("c4")

# mycheeseboard.checkmove(wR,"a1","a4")
# mycheeseboard.checkmove(wR,"a1","e1")
# mycheeseboard.checkmove(wR,"a1","e4")

wR = Rock.new
bB = Queen.new
wQ = Queen.new

wR.valid_move(mycheeseboard,"a1","a4")

wQ.valid_move(mycheeseboard,"a1","d4")
wQ.valid_move(mycheeseboard,"d4","a1")
wQ.valid_move(mycheeseboard,"a1","f1")
wQ.valid_move(mycheeseboard,"a1","e5")
wQ.valid_move(mycheeseboard,"a5","d2")






