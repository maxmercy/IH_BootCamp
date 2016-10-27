require_relative("../lib/blog.rb")

RSpec.describe "My Blog" do 
	before(:each) do
		@blog = Blog.new
	end


	it("#posts returns list of posts") do 

		expect(@blog.posts).not_to eq(nil)
	end		


	it "Order an array of post from most recent to oldest" do
	post1 = Post.new("IronHack2", Time.new(2010,3,13, 13,30,0, "+09:00"),"middle More easy!","maxime","kitchen")
	post2 = Post.new("IronHack",Time.new(2008,6,21, 13,30,0, "+09:00"),"old So easy, Finger in the nose!","marc","travel")
	expect(@blog.sort_posts_antichro([post2,post1])).to eq([post1,post2])
	expect(@blog.sort_posts_antichro([post1,post2])).to eq([post1,post2])

	end		

end
