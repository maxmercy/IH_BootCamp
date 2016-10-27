require "sinatra"
require "sinatra/reloader" if development?
require "./lib/blog.rb"
require "./lib/post.rb"
require "pry"



myblog = Blog.new
# post1 = Post.new("IronHack",Time.new(2008,6,21, 13,30,0, "+09:00") ,"old So easy, Finger in the nose!")
# post2 = Post.new("IronHack2", Time.new(2010,3,13, 13,30,0, "+09:00"),"middle More easy!")
# post3 = Post.new("IronHack3",Time.new(2011,3,13, 13,30,0, "+09:00"),"recent easy!")

# myblog.add_post(post1)
# myblog.add_post(post2)
# myblog.add_post(post3)
# binding.pry



get '/' do
	"hello world"
	redirect to('/blog')
end

get '/blog' do
  @posts = myblog.posts
  myblog.sort_posts_antichro(@posts)

  erb(:blog) 
end



get "/post_details/?:post_index?" do

	@post_index = params[:post_index]
	@post_selected = myblog.posts[@post_index.to_i]

	erb(:post)
end



get "/new_post" do
  # Show the form
  # title = params[:post_title]
  # text = params[:post_text]
 
  erb(:new_post)
end




post "/posted" do
	# binding.pry
  post = Post.new(params[:post_title],  Time.now  ,params[:post_text])

  myblog.add_post(post)
  # Receive the form submission
  #added it to the blog.@post
  redirect to ('/blog')
end




