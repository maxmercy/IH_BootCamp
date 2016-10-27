######### Class for post and sponsorded post ########
######### with print mthd for display post   ########
class Post
  attr_accessor  :title, :date, :content_post
   def initialize(title, date, text)
     @title = title
     @date = date
     @content_post = text
   end



   # def print
   #      puts "\n  #{@title} \n-------------------------"
   #      puts "#{@content_post} \n-------------------------"
   # end
end


class Sponsored_post
       attr_accessor  :title, :date, :text
   def initialize(title, date, text)
     @title = title
     @date = date
     @content_post = text
   end

   # def print
   #      puts "*************************\n****  #{@title}  **** \n*************************".red
   #      puts "#{@content_post} \n*************************".red
   # end
end
