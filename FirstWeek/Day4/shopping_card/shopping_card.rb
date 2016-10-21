require 'date'
require 'pry'



# class ShoppingCart
#   def initialize
#     @items = []
#   end

#   def add_item(item)
#         @items.push(item)
#   end

#   def checkout
#         final_price = 0
#         i = 0
#         @items.each do |pr|
#                 final_price += pr.price
#                 i +=1
#         end

#         # if i >= 5
#         #         final_price = final_price * 0.90
#         # end

#         @items.each do |x| puts x.name end
#         puts " Give me #{final_price.round(2)}€! Quick"
#   end

# end


# class Item
#         attr_reader :name, :price
#   def initialize(name, price)
#       @name = name
#       @price = price
#   end

#   def price
#       @price
#   end
# end

# # 5% reduction for Housware worth more than 100
# class Houseware < Item
#   def price
#       if @price > 100
#         @price = (@price * 0.95)
#       else
#         @price
#       end
#   end
# end

# # 10% reduction the we on fruits
# class Fruit < Item
#   def price
#         t = Date.today
#         if t.wday == 0 || t.wday == 6
#                         @price = @price * 0.90
#         else
#                 @price
#         end
#   end
# end




class ShoppingCard_building
	def initialize
		@price_list = []
		@seasons_price_hash = { fruits: nil, spring: 0, summer: 0, falls: 0, winter: 0}
		@total_list_price = []
		@counter = 1
		@counter2 = 0
	end


	def create

		@price_list = File.read('veget_price.txt').split("\n")  
		@price_list.map! do |x|
			x.split
		end

	
		while @counter < @price_list.length do
			#þrint @price_list[@counter].to_s  + "\n"

			puts "Large Loop  i have #{@price_list[@counter]}"
			# ["apples", "10", "10", "15", "12"]

			@seasons_price_hash.each do |i|




			  

			end
			

			# while @counter2 < @price_list[@counter].length do
			# 	puts  "small loop i have #{@price_list[@counter][@counter2]}"
			# 	@seasons_price_hash[@seasons_price_hash.keys[@counter]] = "#{@price_list[@counter2][@counter]}"
			# 	@counter2 += 1

				
			# end
 			
			puts @seasons_price_hash
 			@counter2 = 0
			
			@counter +=1
		end





binding.pry

	end	
	# IO.readlines('test.txt').map do |line|
 #  	line.split.map(&:to_i)
	# end


end


max_shoppinglist = ShoppingCard_building.new


max_shoppinglist.create

# maxime_cart = ShoppingCart.new


# apples = Fruit.new("Apples", 10)
# oranges = Fruit.new("Oranges", 5)
# grapes = Fruit.new("Grapes", 15)
# banana = Fruit.new("Banana", 20)
# watermelon = Fruit.new("Watermelo,", 50)

# maxime_cart.add_item(apples)
# maxime_cart.add_item(banana)
# maxime_cart.add_item(banana)


# maxime_cart.checkout
