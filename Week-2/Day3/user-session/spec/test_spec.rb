require "./lib/password_validator.rb"

describe PasswordChecker do
	let(:password_checker){PasswordChecker.new}
	it "Must return true if password is longer than 7" do
		expect(password_checker.password_length?("jonsnow@dgmail.com","pass")).to eq(false)
		expect(password_checker.password_length?("jonsnow@dgmail.com","password")).to eq(true)
	end


	it "Must return true if the password contains both upercase and lowercase" do
		expect(password_checker.lowercase_uppercase?("Password")).to eq(true)
	end

	it "Must return true if it does NOT contain the domain name" do
		expect(password_checker.check_contain_domain_or_name?("jonsnow@gmail.com","password")).to eq(true)
		expect(password_checker.check_contain_domain_or_name?("jonsnow@gmail.com","jonsnow")).to eq(false)
	end
	it "Must return true or false if theres a number or not" do
		expect(password_checker.contains_number?("password")).to eql(false)
		expect(password_checker.contains_number?("passw123sad")).to eql(true)
	end
	it "Must return true or false if theres a letter or not" do
		expect(password_checker.contains_letters?("3453633")).to eql(false)
		expect(password_checker.contains_letters?("passw123sad")).to eql(true)
	end
	it "Must return true or false if theres a symbol or special or not" do
		expect(password_checker.contains_symbol?("password%#€€!21")).to eql(true)
		expect(password_checker.contains_symbol?("passw123s1ad")).to eql(false)
	end
	it "Must be true if password valid" do 
		expect(password_checker.check_password("jonsnow@gmail.com","paSsword%#€€!21")).to eq(true)
		expect(password_checker.check_password("jonsnow@gmail.com","passWord233")).to eq(false)
		expect(password_checker.check_password("jonsnow@gmail.com","Pa*33")).to eq(false) 
		expect(password_checker.check_password("jonsnow@gmail.com","passWorgmaild233*")).to eq(false)
	end

end