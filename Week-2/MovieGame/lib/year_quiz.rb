class YearsQuiz
	attr_accessor :movie_list, :years_questions
	def initialize
	end

	def self.random_movie_index
		@random_index = rand(0...(@movie_list.length-1))
	end


	def self.check_unique_date
		random_movie_index
		@date_array = []
		@date_array = @movie_list.map do |movie|
			 movie.release_date
		 end
		 while   @date_array.count(@movie_list[@random_index].release_date) != 1
			 				random_movie_index
		end
		@random_index
	end



	def self.years_questions(movie_list)

		@movie_list = movie_list
		#choose randomly a movie by index

		check_unique_date

		@random_index
		@years_questions = ["Which of this movies was release the #{@movie_list[@random_index].release_date}" ,@random_index]
	 end






end
