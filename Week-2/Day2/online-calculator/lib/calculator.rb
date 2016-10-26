class Calculator
	def initialize(number_1, number_2)
		@number_1 = number_1
		@number_2 = number_2
	end

	def addition
		sum = @number_1 + @number_2
	end

	def multiplication
		product = @number_1 * @number_2
	end

	def substraction
		difference = @number_1 - @number_2
	end

	def division
		if @number_2 == 0
			return "Can not divide by zero"
		else
			quotient = @number_1 / @number_2
		end
	end
end
