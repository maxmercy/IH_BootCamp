

class Blog
    def initialize
        @container = []
        @page = 0
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
        @page =  1

        puts "////////  My Blog ///////\n\n"


        publish_articles


        puts "\n\n"
        i = 0
        while i < @number_page
            i += 1
            print "     " + i.to_s            
        end
        puts "\n\n"
    end



    def publish_articles
        n = @page
       @container[((n*3)-3)..(n*3-1)].each do |post|

             post.print

        #     if post.class == Post
        #     puts "\n #{post.title} \n************************"
        # #    puts "#{post.date}"
        #     puts "#{post.text} \n -------------------------"
        #     else post.class == Sponsored_post
        #         puts "*************************"
        #     puts "******* #{post.title} *******\n*************************"
        #     puts "** #{post.text} **\n*************************"
        #     end
        end
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
        puts "*************************\n****  #{@title}  **** \n*************************"
        puts "#{@text} \n*************************"

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



