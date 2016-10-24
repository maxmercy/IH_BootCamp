require "pry"
require_relative "pieces"




class Cheeseboard
	attr_accessor :board, :piece
	def initialize
 		@board = []
		@coordinate = []
		@piece = piece

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
					print "#{@board[i][y]} --"
				else 
					print  " #{@board[i][y].piecename}"
				end

			end
			puts "\n"
		end	
		puts "  a  b  c  d  e  f  g  h"
		puts "\n\n\n\n"
	end

	#add a piece on the bord
	def add_piece(piece,position)
		position_grille = convert_position_to_array(position)
		x = position_grille[0]
		y = position_grille[1]
		@board[x][y] = piece
		@coordinate = [x,y]
	end






	#check the position status return true if something
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
			puts "At the position #{position}, there is a #{@board[x][y].piecename}"

			true
		end
	end


	def checkmove(origin,destination)

		
		p origin
		p origin_arr = convert_position_to_array(origin)
		p destination
		p destination_arr= convert_position_to_array(destination)

		p  @board[origin_arr[0]][origin_arr[1]].path_validator(sel,fdestination_arr)


		#@piece.valid_move(@myboard,"a1","a6")
	    p @piece.class
	  

  	end



end

class Printer	


	self.def print(test)
		puts test
	end



end

Printer.print("toto")





mycheeseboard = Cheeseboard.new

mycheeseboard.create_board

wR = Rock.new("wR",mycheeseboard)
# bR = Rock.new("bR")
# wQ = Queen.new("wQ")
# bQ = Queen.new("bQ")
# wB = Beeshop.new("wB")
# bB = Beeshop.new("bB")
# wK = Beeshop.new("wK")
# bK = Beeshop.new("bK")

mycheeseboard.add_piece( wR, "a1")
# mycheeseboard.add_piece( wR, "d1")
# mycheeseboard.add_piece( bQ, "b4")
# mycheeseboard.add_piece( wB, "c1")
# mycheeseboard.add_piece( wB, "f1")
# mycheeseboard.add_piece( wB, "c3")
# mycheeseboard.add_piece( wK, "c3")

mycheeseboard.print_board

# mycheeseboard.position_status("a1")

# wR.valid_move(mycheeseboard,"a1","a5")
# wR.valid_move(mycheeseboard,"a1","d6")
# bQ.valid_move(mycheeseboard,"a5","e1")

# wB.valid_move(mycheeseboard,"c1","b1")
# wB.valid_move(mycheeseboard,"c1","f4")
# wB.valid_move(mycheeseboard,"c3","b2")
# wB.valid_move(mycheeseboard,"c3","a5")

wR.valid_move(mycheeseboard, "a1","a4")
# wK.valid_move(mycheeseboard, "c3","e4")
# wK.valid_move(mycheeseboard, "c3","b2")
# wK.valid_move(mycheeseboard, "c3","b4")

# wK.valid_move(mycheeseboard, "c3","e3")
# wK.valid_move(mycheeseboard, "c3","c6")


#mycheeseboard.checkmove("c3","d3")



