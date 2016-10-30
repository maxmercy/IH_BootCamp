class Piece
	attr_reader :color, :coordinate
	def initialize(name)
		@color
		@coordinate = []
	end

	def horizontal_direction(origin_arr,destination_arr)	# ## check direction
		origin_arr[0] == destination_arr[0] || origin_arr[1] == destination_arr[1]
	end

	def diagonal_direction(origin_arr,destination_arr)
		dif_x = destination_arr[0]	- origin_arr[0]
		dif_y = destination_arr[1]	- origin_arr[1]
		if dif_x == dif_y || dif_x == -dif_y then	true else false end
	end



end




class Rock < Piece
	attr_reader :color, :piecename
	def initialize(name)
		@color
		@piecename = name
	end

	def valid_direction?(origin_arr,destination_arr)
			horizontal_direction(origin_arr,destination_arr)
	end
end

class Queen < Piece
	attr_reader :color, :piecename
	def initialize(name)
		@color
		@piecename = name
	end

	def valid_direction?(origin_arr,destination_arr)
			horizontal_direction(origin_arr,destination_arr) || diagonal_direction(origin_arr,destination_arr)
	end
end

class King < Piece
	attr_reader :color, :piecename
	def initialize(name)
		@color
		@piecename = name
	end

	def valid_direction?(origin_arr,destination_arr)
		  if (destination_arr[0] - origin_arr[0]).abs < 2 && (destination_arr[1] - origin_arr[1]).abs < 2
		 			horizontal_direction(origin_arr,destination_arr) || diagonal_direction(origin_arr,destination_arr)
			else false
			end
	end
end

class Bishop < Piece
	attr_reader :color, :piecename
	def initialize(name)
		@color
		@piecename = name
	end

	def valid_direction?(origin_arr,destination_arr)
			diagonal_direction(origin_arr,destination_arr)
	end
end
