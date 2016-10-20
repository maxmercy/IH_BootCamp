require "pry"


class PasswordCheck

	def initialize ( user )
	@user = user 
	end	

	def check_credential
		puts "Enter your password."
		@chomp_password = gets.chomp

		check =true if 	 @chomp_password == @password
	else check = false

binding.pry
 	end



end



class User
	attr_reader :password
	def initialize (name, password)
	@name = name 
	@password = password
	end	
	

end



user0 = User.new( "maxime", "max")

test = PasswordCheck.new( user0)

test.check_credential


