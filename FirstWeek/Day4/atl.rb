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

           

           @word_result = @start_array.each_with_index.map do |character, index|
               if index == @counter
                   if character == @final_array[index]
                       character
                   else
                       @final_array[index]
                   end
               else
                   character
               end
           end

           if @dictionary.exists?(@word_result.join)
               @existing_words.push(@word_result.join)
               @word_result.join

               find_chain(@word_result.join, final)

           else
               start
               
           end
            
            @counter += 1
           find_chain(start, final)

        # until test_array.join == @final_array.join do 
        #     puts @start_array
 #        test_array.each_with_index do |item, i|
 #            puts @start_array
 #           if test_array[i] == @final_array[i]
               
 #           else 
 #               buffer_array = test_array
 #               buffer_array[i] = @final_array[i]
 #               if @dictionary.exists?(buffer_array.join) == true 
                   
 #                   test_array[i] = @final_array[i]
 #                   puts test_array.join
                    
 #               else
 #                   # puts buffer_array.join
 #                   puts test_array.join
 #                   puts @start_array
 #                   puts @final_array
                   

 #               end
 #           end
 #       end
 #       end











           #i = 0

=begin
    
    

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
=end






       #metode que canvia cada lletra per passae de una a laltre 
   end

end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")