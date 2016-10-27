
class FizzBuzz
	def initialize 
	@result_array = []
	end



	def array_construction

		i = 0

		for i in 00..99
			x = (i+1).to_s
			@result_array[i] = x
		end


		@result_array.each do |x|
	
			if x.to_i % 3 == 0
	        	@result_array[x.to_i-1] = "Fizz"
	   		end

	   		if x.to_i % 5 == 0
	   			if @result_array[x.to_i-1] == "Fizz"
	   			      	@result_array[x.to_i-1] << "Buzz"
			    else 
	   			      	@result_array[x.to_i-1] = "Buzz"
			    end
	   		end


	   		@result_array.each_index do |i|
	   			if i.to_s[0] == "1" 
	   				@result_array[i+1] = "Bang"
	   					

	   			end



	   		end





	   	end

	p @result_array
	@result_array
	end





     # x = i.to_s
        # if x[0] == "1"
        #         @result_array[i] << "Bang"
        # end

	
end


mybuzz = FizzBuzz.new


mybuzz.array_construction




   
