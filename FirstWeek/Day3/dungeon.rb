require"pry"

module MovementCommand
	def movement 
			puts "where do you want to go?"
			print "There is a door"			
			@actualroom.doors.keys.each { |i| print " to the ", i }
			print ".\n>"
			direction = gets.chomp.upcase

			new_room = @actualroom.doors.select { |key, value| key.to_s == direction }
			
 			if new_room.values[0] != nil
 				@actualroom = @allroom[new_room.values[0]]
 			elsif direction == "N" || direction == "S" || direction == "E" || direction == "W"
 				puts "You run into the Wall!! Be Carefull!"
 				movement				
 			else 
 				puts "I do not understand"
 				movement
 			end

 			puts direction
 			
			action
		
	end
end


module ActionInRoom

	def give_description
			system "clear"
			puts "\n\n\n"
			puts @actualroom.description_of_room
	end

	def choice 

	end
	
end


class Game
	include MovementCommand
	include ActionInRoom
	def initialize (allroom)
	@actualroom = allroom[0]
	@allroom = allroom
	end


	def action

			give_description

			choice

			movement

	end

end

class Room
	attr_accessor :doors, :name, :treasure_box, :description_of_room
	def initialize(doors, name, treasure_box, description_of_room)
		@doors = doors
		@name = name
		@treasure_box = treasure_box
		@description_of_room = description_of_room

	end



	

	def description
		puts @description_of_room
	end
end


room0 = Room.new(
	{:N => 1 , :E => 2, :W => 3}, 
	"Main Room", 
	["Origin Room"], 
	"This is the starting room."
	)


room1 = Room.new(
	{:S => 0}, 
	"chevalry room", 
	["sword", "You found the sword"], 
	"You're in a light room, check what is in the box or go."
	)

room2 = Room.new(
	{:W => 0 , :N => 4}, 
	"dark room", 
	["deadly spider", "You are bitted by deadly spider"],
	 "You're in a dark room, check what is in the box or go."
	 )

room3 = Room.new(
	{:E => 0}, 
	"flask room", 
	["glowing flask", "You found a glowing flask"], 
	"You're in a dark room, check what is in the box or go."
	)

room4 = Room.new(
	{:S => 2, :E => 5},
	 "treasure room", 
	 ["glowing flask", "You found a glowing flask"], 
	 "You're in a room with Armoiries painted all over the wall,\n check what is in the box or go."
	 )

room5 = Room.new(
	{:W => 4}, 
	"Outside", 
	["Release a Captif Agressive Dwarf", "You are attacked"], 
	"A brigth ligth blinded you. Fresh air reach you. You're Free!! You're outside!!! "
	)


array_room = [room0, room1, room2, room3, room4, room5]

mydungeon = Game.new(array_room)

mydungeon.action

#mydungeon.give_description	


	#binding.pry



