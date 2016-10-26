require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do 
	"Hello World"
end

get '/Hi' do
	@time = DateTime.now	
	@ingredients = ["egg","chocolat","flours","sugar","butter"]
	erb :hidate
end





get '/users/:user' do
	@user = params[:user]

	erb:profile
end









# get '/date' do

# end






# get '/about' do
# 	@name = 'Maxime'  #it will be accessible only in page about as 'class variable'
# 	erb :about	
# end









