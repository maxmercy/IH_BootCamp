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
 			elsif direction == "Q"	
 				quit
			else 
 				puts "I do not understand. To exit press (Q)"
 				movement
 			end
 			puts direction	
			action	
	end


	def quit
		puts "You want to leave? Y , N"
		ans = gets.chomp.upcase
		if ans == "N"
			puts "Great, let's go back to the dungeon."
			movement
		else 
			puts "No I mean realy? Y, N "
			if gets.chomp.upcase == "N"
				puts "Great, let's go back to the dungeon."
				movement
			else 
				puts "Ok. I'm so sad. Ciao."
				exit	
			end
		end
	end

end


module ActionInRoom

	def give_description
			system "clear"
			puts "\n\n\n"
			puts @actualroom.description_room
	end

	def choice 
			puts "No ACTION!!! It is a boring game. Just choose a direction."
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
	attr_accessor :doors, :description_of_room
	def initialize(doors, description_of_room)
		@doors = doors
		@description_of_room = description_of_room

	end

	def description_room
		puts @description_of_room[0]
	end
end




room0 = Room.new(
	{:N => 1 , :E => 2, :W => 3}, 
	["This is the starting room."]
	)


room1 = Room.new(
	{:S => 0}, 
	["You're in a sanctuary, a knight stone tomb are seatle in the middle of the room. Century's of dust cover the stone.
	 You examine the vault and see that the lid balances sligthly.",
	 "sword",
	 "You found the sword"]
	)

room2 = Room.new(
	{:W => 0 , :N => 4}, 
	["You're in a dark room. There is piece of squeleton all around the ground.A rayligth from a small opening in the ceilling bring your eyes on something.
A red ring boxes with golden border stand on a stone pedestals.",
	 "deadly spider",
	 "You are bitted by tiny black spider, tiny but deadly. You scream. You are dead."]
	 )

room3 = Room.new(
	{:E => 0}, 
	["You're in a dark room, There is a antic wood chest",
	 "A pair of leather boot. Yours are quite old and smelly.",
	 "deadly spider",
	 "You are bitted by tiny black spider, tiny but deadly. You scream. You are dead."]
	)

room4 = Room.new(
	{:S => 2, :E => 5},
	 ["You're in a room with Armoiries painted all over the wall,\n There is a clothes chest",
	 "a Glowing flask",
	 "You are feeling strong! Nobody can defeat you! On the flask you can read: Invicibility guaranteed*! (*execpted for deadly spider)"] 
	 )

room5 = Room.new(
	{:W => 4}, 
	["A brigth ligth blinded you. Fresh air reach you. You're Free!! You're outside!!! "]
	)



array_room = [room0, room1, room2, room3, room4, room5]

mydungeon = Game.new(array_room)

mydungeon.action

#mydungeon.give_description	


	#binding.pry
