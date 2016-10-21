require "pry"
require_relative "pieces"

class Cheeseboard
	def initialize
		@board = []
	end

	def create_board
		8.times do @board << [nil,nil,nil,nil,nil,nil,nil,nil]
		end
	end

	def print_board
		puts "**************************************"
		puts "|                                    |"
		puts "|          Actual board              |"
		puts "|                                    |"
		puts "**************************************"
		@board.each_index do |i|
			@board[i].each_index do |y|
				if @board[i][y] == nil 
					print "#{@board[i][y]} [_]"
				else 
					print  " #{@board[i][y]} "
				end

			end
			puts "\n"
		end		
	end

	def add_piece(piece,position)
		x = position[0]
		y = position[1]
		@board[x][y] = piece
	end

	def position_status(position)
		x = position[0]
		y = position[1]

		if @board[x][y] != nil
			puts "At the position #{position}, there is a #{@board[x][y]}"
		else
			puts "At the position #{position}, there is nothing"
		end
	end

end






# mycheeseboard = Cheeseboard.new

# mycheeseboard.create_board
# mycheeseboard.print_board

# mycheeseboard.add_piece(:wR, [7,0])
# mycheeseboard.add_piece(:wR, [7,7])
# mycheeseboard.add_piece(:bR, [0,0])
# mycheeseboard.add_piece(:bR, [0,7])

# mycheeseboard.print_board

# mycheeseboard.position_status([0,7])
# mycheeseboard.position_status([3,7])

rock1 = Rock.new

rock1.respond


binding.pry
