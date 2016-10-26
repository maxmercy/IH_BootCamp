require 'sinatra'
require 'sinatra/reloader' if development?
require 'artii'


get '/' do 
	"Hello World"
end

get '/ascii' do
	"ASCII CONVERTER"
end	


get '/ascii/otter/special/secret' do
	 erb :otter	
end


get '/ascii/?:wordinput/?:fontinput?' do
	@word = params[:wordinput]
	if params[:fontinput] != nil 
	art = Artii::Base.new :font => params[:fontinput]
	else
	art = Artii::Base.new 
	end	
	@wordart = art.asciify params[:wordinput] 


	erb :wordascii

end



