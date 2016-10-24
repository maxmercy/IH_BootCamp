class Calculator


	def add(string)


		total = 0
		string.split(',').each do |numb|
			total += numb.to_i
		end

		total



	end



end
