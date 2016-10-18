require 'colorize'

require 'io/console'

class Blog
    def initialize
        @container = []
        @page = 1
        @number_page = 0
    #    @new_post = new_post
    end

    

    def add_post(new_post)
        @container << new_post

    #    puts @container
    end

    def calc_number_page
        if @container.length % 3 == 0
            @number_page = @container.length / 3
        else
            @number_page = @container.length / 3 + 1
        end
    end 

    def publish_front_page
        calc_number_page
        @container.sort! { |x,y| y.date <=> x.date }
       

        puts "////////  My Blog ///////\n\n"

        publish_articles

        puts "\n\n"
        i = 0
        while i < @number_page
            i += 1
            if i == @page
                print "     " + i.to_s.blue 
            else 
                print "     " + i.to_s
            end

        end
        puts "\n"
        prevnext

        puts "\n\n"

        navigationbis

    end



    def publish_articles
        n = @page
       @container[((n*3)-3)..(n*3-1)].each do |post|
             post.print
        end
    end


    def prevnext
        if  @page == 1
            puts "          | next >"
        elsif @page == @number_page 
            puts "   < prev |       "
        else
             puts "   < prev | next >"
         end
    end

    
    def next_page
        @page += 1
    end

    def prev_page
        @page -= 1  
    end

    # def navigation
    #    if  @page == 1
    #         puts " choose next / exit >"
    #     elsif @page == @number_page 
    #         puts " choose prev / exit  "
    #     else
    #          puts "choose prev / next / exit"
    #     end
       
    #     answer = gets.chomp
    #     case answer

    #     when "prev" 
    #         prev_page
            

    #     when "next" 
    #         next_page
            

    #     when "exit"
    #         puts "bye bye"
    #         abort
    #     end

    #     if @page < 1
    #         @page = @number_page
    #     elsif @page > @number_page
    #         @page = 1 
    #     end


    #     publish_front_page

    # end

    def navigationbis
       puts "navigate with left / rigth arrow\n escape key to exit"
       # Reads keypresses from the user including 2 and 3 escape character sequences.
       c = read_char
       case c

       when "\e[D"   #left arrow
         prev_page  

        when  "\e[C" # right arrow
            next_page
        when "\e"   # escape key
            puts "Bye Bye!"
            abort

        else "I do not understand."
        end


        if @page < 1
            @page = @number_page
        elsif @page > @number_page
            @page = 1 
        end


        publish_front_page

    end



    def read_char
      STDIN.echo = false
      STDIN.raw!

      input = STDIN.getc.chr
      if input == "\e" then
        input << STDIN.read_nonblock(3) rescue nil
        input << STDIN.read_nonblock(2) rescue nil
      end
    ensure
      STDIN.echo = true
      STDIN.cooked!

      return input
    end
end


class Post
  attr_accessor  :title, :date, :text
   def initialize(title, date, text)
     @title = title
     @date = date
     @text = text
   end

   def print
        puts "\n  #{@title} \n-------------------------"
        puts "#{@text} \n-------------------------"

    end



end

class Sponsored_post 
       attr_accessor  :title, :date, :text
   def initialize(title, date, text)
     @title = title
     @date = date
     @text = text
   end

   def print
        puts "*************************\n****  #{@title}  **** \n*************************".red
        puts "#{@text} \n*************************".red

    end


end


blog = Blog.new
firstpost = Post.new("IronHack",Time.new(2008,6,21, 13,30,0, "+09:00") ,"So easy, Finger in the nose!")
secondpost = Sponsored_post.new("IronHack2", Time.new(2010,3,13, 13,30,0, "+09:00"),"More easy!")
thirdpost = Post.new("IronHack3",Time.new(2011,3,13, 13,30,0, "+09:00"),"More easy!")
fourpost = Post.new("IronHack4",Time.new(2012,3,13, 13,30,0, "+09:00"),"More easy!")
fivepost = Post.new("IronHack5",Time.new(2013,3,13, 13,30,0, "+09:00"),"More easy!")
sixpost = Sponsored_post.new("IronHack6",Time.new(2014,3,13, 13,30,0, "+09:00"),"More easy!")
sevenpost = Post.new("IronHack7",Time.new(2015,3,13, 13,30,0, "+09:00"),"More easy!")
eightpost = Post.new("IronHack8",Time.new(2015,4,13, 13,30,0, "+09:00"),"More easy!")
ninepost = Post.new("IronHack9",Time.new(2016,3,13, 13,30,0, "+09:00"),"More easy!")


blog.add_post(firstpost)
blog.add_post(secondpost)
blog.add_post(thirdpost)
blog.add_post(fourpost)
blog.add_post(fivepost)
blog.add_post(sixpost)
blog.add_post(sevenpost)
blog.add_post(eightpost)
blog.add_post(ninepost)



blog.publish_front_page


