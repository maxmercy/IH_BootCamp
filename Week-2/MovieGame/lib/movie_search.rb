require "themoviedb"

Tmdb::Api.key("7ff797c2799958357c0a45e8f65f45b2")


class MovieList
	def initialize
		@all_movies = []
	end


	def get_movies(word_user)
			@all_movies = Tmdb::Movie.find(word_user)
	end

	def reduce_movies_list(n)
			if @all_movies.length > n
			@all_movies = @all_movies[1..n]
			end
	end

	def pict_check_movie_list
			@all_movies.delete_if { |key,value| value = nil }
	end


	def pict_path_modificator
			@all_movies.each_with_index do |movie,index|
				path = MoviePicture.new.path_to_picture(movie)
				@all_movies[index].poster_path = path
			end
	end

	def movie_quiz(word_user)
			get_movies(word_user)
			reduce_movies_list(20)
			pict_check_movie_list
			reduce_movies_list(6)
			pict_path_modificator
			@all_movies
	end


end



class MoviePicture
    def path_to_picture(movie)
      if movie.poster_path != nil
        path = "https://image.tmdb.org/t/p/w154/#{movie.poster_path}"
      else path = nil
      end
    end
end




#
# movie.original_title,
# movie.release_date
# picture_path  movie.path
