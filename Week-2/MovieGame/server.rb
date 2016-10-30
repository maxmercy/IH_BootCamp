require "sinatra"
require "sinatra/reloader" if development?
require "./lib/movie_search.rb"
require "./lib/quiz_intelligence.rb"
require "./lib/year_quiz.rb"
# require "./lib/.rb"
require "themoviedb"
require "pry"


get '/' do
	"Super Movie Quiz"
	redirect to('/movie_search')
end

get '/movie_search' do
  erb(:movie_search)
end

post "/post_user_word" do
	@user_word = params[:user_word]
	#return urs_list with hask title date and cast
	redirect to("/movie_quiz/challenge/#{@user_word}")
end

get "/movie_quiz/challenge/:user_word" do
	@movie_list = MovieList.new.movie_quiz(params[:user_word])
	@question_answer = MovieQuiz.quiz(@movie_list)
	erb(:movie_quiz)
end


post "/check_answer" do
	@value_answer = params[:user_answer]
	# @response = CorrectIncorrect.results(@value_answer)
	redirect to("/check_answer/#{@value_answer}")

end

get "/check_answer/:value" do
@statut = params[:value]
erb(:check_answer)
end
