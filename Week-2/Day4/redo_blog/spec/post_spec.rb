 require_relative("../lib/post.rb")


RSpec.describe "My post" do 
	before(:each) do
		@post = Post.new("Test Title", Time.new(2008,6,21, 13,30,0, "+09:00") , "Ceci est post vieux")
		@post2 = Post.new("Test Title2", Time.new(20010,6,21, 13,30,0, "+09:00") , "Ceci est post recent ")
	end


	it ("Post title should be \"Test Title\"") do 
		expect(@post.title).to eq("Test Title")	
		expect(@post2.title).to eq("Test Title2")	
	end		

	it ("Post date should be of class Date") do 
		expect(@post.date.class).to eq(Time)	
	end		

	it ("Post content should be a string") do 
		expect(@post.content_post).to eq("Ceci est post vieux")
		expect(@post2.content_post).to eq("Ceci est post recent ")
	end		


end


