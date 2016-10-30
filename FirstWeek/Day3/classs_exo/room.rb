
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

