class Blog
    def initialize
        @container = []
    #    @new_post = new_post
    end

    def add_post(new_post)
        @container << new_post
    #    puts @container
    end

    def publish_front_page
        @container.sort! { |x,y| y.date <=> x.date }
        @container.each do |post|

            if post.class == Post
            puts "#{post.title} \n ************************"
        #    puts "#{post.date}"
            puts "#{post.text} \n --------------------"
            else post.class == Sponsored_post
                puts "*************************"
            puts "******* #{post.title} *******\n*************************"
            puts "** #{post.text} **\n --------------------"

            end
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
end

class Sponsored_post 
       attr_accessor  :title, :date, :text
   def initialize(title, date, text)
     @title = title
     @date = date
     @text = text
   end

end


blog = Blog.new
firstpost = Post.new("IronHack",Time.new(2008,6,21, 13,30,0, "+09:00") ,"So easy, Finger in the nose!")
secondpost = Sponsored_post.new("IronHack2", Time.new(2010,3,13, 13,30,0, "+09:00"),"More easy!")
thirdpost = Post.new("IronHack3", Time.now,"More easy!")


blog.add_post(firstpost)
blog.add_post(secondpost)
blog.add_post(thirdpost)

blog.publish_front_page
