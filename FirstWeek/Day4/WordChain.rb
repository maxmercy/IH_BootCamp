require 'ruby-dictionary'


class WordChain
   def initialize(dictionary)
       @dictionary = dictionary
       @existing_words = []
       @counter = 0
   end

  def find_chain(start, final)

          puts start
          @start_array = start.each_char.to_a
          @final_array = final.each_char.to_a
           
          @test_array = start.each_char.to_a


          while ( @test_array != @final_array ) && @counter < 200 do
             array_exploration
             @counter += 1
           end

           puts "Game Over: No transformation found" if @counter == 200
  end




  def array_exploration
      
      @test_array.each_with_index do |char,index|
            if @test_array[index] != @final_array[index]
                  @test_array[index] = @final_array[index]
                      if @dictionary.exists?(@test_array.join) != true

                      @test_array[index] = char
                    else
                      puts @test_array.join
                    end
               
               end
            end
      end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("rodeo", "meteo")



