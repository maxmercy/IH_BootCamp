require "./app"

describe Calculator do


	let(:calculator) { Calculator.new}


	it "should retirn 0 for empty string" do
		expect(calculator.add("")).to eq(0)
	end


	it "should return 2 for that number" do
		expect(calculator.add("2")).to eq(2)
	end


	it "should return 3 for that number" do
		expect(calculator.add("2,1")).to eq(3)
	end


end



