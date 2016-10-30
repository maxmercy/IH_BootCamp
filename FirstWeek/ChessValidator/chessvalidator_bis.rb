require "pry"
require_relative "pieces"
require_relative "position_print"


class Cheeseboard
  include PrintBoard , ConvertCoord , SetBoard, Validator
	attr_accessor :board, :piece, :coordinate
	def initialize
 		@board = []
		@coordinate = []
		@piece = piece

	end

  def create_board
    8.times do @board << [nil,nil,nil,nil,nil,nil,nil,nil]
    end
  end

  def validator(origin,destination)
    test = []
    @position_origin = convert_position_to_array(origin)
    @position_destination = convert_position_to_array(destination)
    @piece_at_origin = @board[@position_origin[0]][@position_origin[1]]
    @piece_at_destination = @board[@position_destination[0]][@position_destination[1]]
    #check if destination empty or piece's color of destination
    test << destination_color

    #check direction
    test << @piece_at_origin.valid_direction?(@position_origin,@position_destination)

    #check something in the path

    case @piece_at_origin.class.to_s
    when "Rock"
        test << path_validator_horizontal_vertical

    when "Queen"
      test << path_validator_horizontal_vertical || path_validator_diagonal

    when "Bishop"
      test << path_validator_diagonal


    when "King"
      p path_validator_horizontal_vertical
      p path_validator_diagonal
    end


   if test.include? "false" then puts "INVALID" else puts "VALID" end
  end






end





theboard = Cheeseboard.new
theboard.create_board

wR = Rock.new("wR")
bR = Rock.new("bR")
wQ = Queen.new("wQ")
bQ = Queen.new("bQ")
bB = Bishop.new("bB")
wB = Bishop.new("wB")
bK = King.new("bK")
wK = King.new("wK")


theboard.add_piece( bQ, "a1")
theboard.add_piece( bK, "e4")
theboard.add_piece( wR, "g6")
theboard.add_piece( wQ, "d5")
theboard.add_piece( bB, "c2")


theboard.print_board

theboard.validator("e4","d5")
theboard.validator("e4","e5")
theboard.validator("e4","e6")
theboard.validator("e4","e3")
theboard.validator("e4","e1")
theboard.validator("e4","d3")
