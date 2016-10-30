class PasswordChecker
	def check_password(email, password)
		password_length?(email, password) &&
		lowercase_uppercase?(password) &&
		check_contain_domain_or_name?(email,password) &&
		contains_num_let_sym(password)
		 

	end

	def password_length?(email, password)
		 password.length >= 7
	end

	def lowercase_uppercase?(password)
		 uppercase?(password) && lowercase?(password)
	end

	def uppercase?(password)
		ans = false
		password.each_char do |char|
			if char == char.upcase
				ans = true

			end
		end
		ans
	end
	def lowercase?(password)
		ans = false
		password.each_char do |char|
			if char == char.downcase
				ans = true
			end
		end
		ans
	end

	def check_contain_domain_or_name?(email,password)
		email_splitted = email.split("@")
		domain_name = email_splitted[1].split(".")[0]
		name = email_splitted[0]
		!password.include?(domain_name) && !password.include?(name)
	end

	def contains_num_let_sym(password)
		contains_number?(password) &&
		contains_letters?(password) &&
		contains_symbol?(password) 
	end

	def contains_number?(password)
		password.count("0-9") > 0
	end

	def contains_letters?(password)
		password.downcase.count("a-z") > 0		
	end
	def contains_symbol?(password)
		total = 0
		total += password.count('!#$%&()*+,-./:;<=>?@[\]^_`{|}~)"') 
		total += password.count("'") 
		total > 0
	end
end

