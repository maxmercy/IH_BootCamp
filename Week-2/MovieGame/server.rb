require "sinatra"
require "sinatra/reloader" if development?
require "./lib/movie_search.rb"
require "./lib/movie_data.rb"
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

  @movie_list =	MovieList.new.movie_quiz(params[:user_word])
  	 @quiz_question = "To be implemented"
	erb(:movie_quiz)

end
