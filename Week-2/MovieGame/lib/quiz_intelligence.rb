
require "themoviedb"

Tmdb::Api.key("7ff797c2799958357c0a45e8f65f45b2")




class MovieQuiz
	attr_accessor :movie_list, :years_question
	def initialize

	end


  def self.quiz(movie_list)
		@movie_list = movie_list
  	@years_question = YearsQuiz.years_questions(@movie_list)
  	#shoudl return array String question (with date), index of the answer
		return @years_question
  end
end


class CorrectIncorrect


	def self.results(value)
		if value == true
			response = "Well Done, you answer correctly"
		else
			response = "Not correct."
		end
		return response
	end

end
