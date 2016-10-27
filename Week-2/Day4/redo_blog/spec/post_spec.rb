 require_relative("../lib/post.rb")


RSpec.describe "My post" do 
	before(:each) do
		@post = Post.new("Test Title", Time.new(2008,6,21, 13,30,0, "+09:00") , "Test", "maxime","Cooking")
		@post2 = Post.new("Test Title2", Time.new(20010,6,21, 13,30,0, "+09:00") , "Test", "marc","travel")
	end


	it ("Post title should be \"Test Title\"") do 
		expect(@post.title).to eq("Test Title")	
		expect(@post2.title).to eq("Test Title2")	
	end		

	it ("Post date should be of class Date") do 
		expect(@post.date.class).to eq(Time)	
	end		

	it ("category should be accessible") do 
		post = Post.new("title",Time.now,"content","author","category")
		expect(post.content_post).to eq("content")	
		expect(@post2.content_post).to eq("Test")	

	end	

	it ("author should be accessible") do 
		post = Post.new("title",Time.now,"content","author","category")
		expect(post.author).to eq("author")	
	end		

	it ("category should be accessible") do 
		post = Post.new("title",Time.now,"content","author","category")
		expect(post.category).to eq("category")	
		expect(@post2.category).to eq("travel")	

	end	

end


