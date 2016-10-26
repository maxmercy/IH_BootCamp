class FileSaver
	def initialize
	end

	def store(result)
		marshaled_information = Marshal.dump(result)
		IO.write("./public/result.txt", marshaled_information)
		

	end

	def load_file
		result = IO.read("./public/result.txt")
		result = Marshal.load(result)
		result_bol = result

	end

end



