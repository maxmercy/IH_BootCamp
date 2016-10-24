class Lexiconomitron



	def eat_t(text)
		#have to remove the t
		text.delete("tT")
		# text_bis_array = []

		# text.each_char do  |c| 
		# 	 if c.downcase != "t" 
		# 	   text_bis_array << c
		# 	end
		# end

		# text_bis_array.join
	end


	def lexi_rever(word_array)
		word_array_reverse = word_array.map do |word|
			word.reverse
		end

	end

	def lexi_extrem(word_array)
		
		word_array_extrem = []
		word_array_extrem << word_array[0]
		word_array_extrem << word_array[-1]
		
		
	end



	def shazam(word_array)
		

		array_shazamed =  lexi_extrem(lexi_rever(word_array))
		array_shazamed.map! do |word|
			eat_t(word)
		end

		p array_shazamed
		array_shazamed

	end




end

mytext = Lexiconomitron.new

mytext.eat_t("toto")

mytext.shazam(["toto","youpi","Maxime"])
