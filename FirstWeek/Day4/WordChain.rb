require 'ruby-dictionary'


class WordChain
   def initialize(dictionary)
       @dictionary = dictionary
       @existing_words = []
       @counter = 0
   end

  def find_chain(start, final)


            @start_array = start.each_char.to_a
           @final_array = final.each_char.to_a
           
           test_array = @start_array

           i = 0

           while @test_array != @final_array do
               @saved_array = @test_array
               @test_array[i] = @final_array[i]
               i += 1
               
               if @dictionary.exists?(@test_array.join) == true
                   puts @test_array.join
               elsif @dictionary.exists?(@test_array.join) == false
                   @test_array = @saved_array
               end
           end

   end

end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")