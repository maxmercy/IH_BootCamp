

class Database
	def initialize
		@users_data = [
				{user: "jonsnow", password:"nice"},
				{user: "neil", password:"password"}
			]
	end

	def find(username)
   	  user  = @users_data.find {|user| user[:user] == username}
   	  user
	end

	def exists?(user, username, password)
		user[:user] == username && user[:password] == password

	end

	def login?(username,password)
		user = find(username)
		if user.nil?
			false
		else
			exists?(user, username, password)
		end
	end
end