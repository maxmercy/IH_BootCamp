require "sinatra"
require "sinatra/reloader"
require "./lib/password_validator"
require "./lib/user_validate"
require "pry"
enable :sessions

$database = Database.new
get '/' do
	
	erb :home
end


post '/' do
	@username = params[:user_name]
	@password = params[:password]
	if $database.login?(@username, @password) == true
		session[:username] = @username
		session[:password] = @password
		redirect to("/login")
	else
		erb :home

	end
	
end
get "/login" do
	@user = session[:username]
	puts @user
	erb :login
end

get '/logout' do
	session.clear
	redirect to("/")
end

