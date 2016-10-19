require "imdb"

module CallImdb
	def getmovie(movie)
	@all_movies = Imdb::Search.new(movie)
	@movie_info = @all_movies.movies[0]

		#i = Imdb::Search.new("Star Trek")
	end	

end

class MovieFront
	attr_accessor :film
	include CallImdb
	def initialize(list)
		@movie_and_rates =[]
		@mylist = list
		@movies_list_rated = {}
	end
	def get_info

		@movies_list_rated = @mylist.movies_list.map do |film|
			getmovie(film)
			#title = @movie_info.title 
			#p @movie_info.rating 
			@film = [@movie_info.title, @movie_info.rating]
		end
	end
	

	def print_rating
        10.downto(0) do |num|
            @movies_list_rated.each do |movie|
                print "|"
                if num <= movie[1].to_i
                    print "#"
                else
                    print " "
                end
            end
            print "|"
            puts ""
        end

        puts @movies_list_rated
    end    
end

class MovieList
	attr_accessor :movies_list 
	def initialize
		@movies_list = []
	end
	def create_list
		File.open("movie.txt").each do |movie|
			@movies_list.push(movie.chomp)
		end
	end

end



mylist = MovieList.new
mylist.create_list


myfront = MovieFront.new(mylist)
myfront.get_info

myfront.print_rating


# require"pry"
# binding.pry