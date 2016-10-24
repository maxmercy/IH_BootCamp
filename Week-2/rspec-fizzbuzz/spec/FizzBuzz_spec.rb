require "./FizzBuzz"


describe FizzBuzz do 


	let(:myfizzbuzz) { FizzBuzz.new}

	it "for i = 1  should return string 2 " do
		expect(myfizzbuzz.array_construction[1]).to eq("2")
	end


	it "for value 3 cell 2  should return Fizz " do
		expect(myfizzbuzz.array_construction[2]).to eq("Fizz")
	end

	it "for value 5 cell 4 should return Buzz " do
		expect(myfizzbuzz.array_construction[4]).to eq("Buzz")
	end

	it "for value 30 cell 29 should return FizzBuzz" do
		expect(myfizzbuzz.array_construction[29]).to eq("FizzBuzz")
	end


	it "for value 15 cell 14 should return FizzBuzz" do
		expect(myfizzbuzz.array_construction[14]).to eq("FizzBuzzBang")
	end


end
