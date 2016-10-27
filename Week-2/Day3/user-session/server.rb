require "sinatra"
require "sinatra/reloader"
enable(:sessions)
require "./lib/user"



get "/" do
	params[:loginfo] = nil
	erb(:login)	
end


post "/login" do
	if params[:username] == 'max' && params[:password] == "toto"
		session[:username] =  params[:username]
		redirect to ("/private-space")

	else
		redirect to ("/login-error")
	end

end


get "/private-space" do
	if session[:username] != nil
		erb(:privatespace)
	else
		erb(:loginerror)
	end

end

post "/unlogin" do
	if params[:loginfo] = "unlog"
		session[:username] = nil
		redirect to ("/")
	end
end


get "/login-error" do
	if params[:loginfo] = "retry"
		
		redirect to ("/")
	end
	erb(:loginerror)

end



