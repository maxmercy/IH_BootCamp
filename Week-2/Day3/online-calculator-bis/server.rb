require "sinatra"
require "sinatra/reloader"
require "./lib/calculator"
require "./lib/filesaver"
require 'pry'


get "/?:saved_values?" do 
	@buton_memo = false
	# @return_save = nil # binding.pry
	if params[:saved_values] == "yes"
	@return_save = FileSaver.new.load_file
	end
	erb(:index)
	end

post "/result" do
	@first_number = params[:number_1].to_f
	@second_number = params[:number_2].to_f
	@operation = params[:operation]
	@result = Calculator.new(@first_number, @second_number).send(@operation)
	erb(:result)
end


post "/store_result" do
	FileSaver.new.store(params[:operation])
	redirect to ("/")
end





