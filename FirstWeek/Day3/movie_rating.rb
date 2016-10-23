require "imdb"
require"pry"
module CallImdb
	def getmovie(movie)
	@all_movies = Imdb::Search.new(movie)
	@movie_info = @all_movies.movies[0]	
	end	
end

module Histogram
	def print_histogram
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

		i = 1
        @movies_list_rated.length.times do
        	print "---"      	
        	i +=1
        end
    	puts

		i = 1
        @movies_list_rated.length.times do
        	print "|"
        	print i
        	i +=1
        end
        puts "|"

 	end


 	def print_list_movies
 		@movies_list_rated.each_index do |i|
 			puts  (i+1).to_s + ". " + @movies_list_rated[i][0]
 		end
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


class MovieFront
	attr_accessor :film
	include CallImdb
	include Histogram
	def initialize(list)
		@movie_and_rates =[]
		@mylist = list
		@movies_list_rated = {}
	end
	def get_info
		@movies_list_rated = @mylist.movies_list.map do |film|
			getmovie(film)
			@film = [@movie_info.title, @movie_info.rating]
		end
	end
	
	def histo_list_film
		print_histogram
		print_list_movies
	end
end


mylist = MovieList.new
mylist.create_list

myfront = MovieFront.new(mylist)
myfront.get_info

myfront.histo_list_film



