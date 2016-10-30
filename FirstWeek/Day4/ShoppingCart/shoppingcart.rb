require 'date'
require 'pry'
require_relative "module.rb"
require_relative "module_fruits.rb"
 #Trolley is a hash with :item as key => value [quantity,price,discount]

class ShoppingCart
  include Apple
  include Orange
  include Banana
  include Grapes
  include Watermelon
  include Time_check

  def initialize(price_table)
    @trolley = Hash.new(0)
    @price_table = price_table
  end

  def add_item_to_cart(item)
    item = item.to_sym
    if @trolley.key?(item) == false
      @trolley[item] = [ +1 , 0 , 0]
    else
      @trolley[item][0] += 1
    end
  end


  def cost
    @trolley.each { |key,value|
    send("#{key}_cost")
    }
  end

  def total_cost
    total_price = 0
    @trolley.each_pair { |k,v|
       # binding.pry
      total_price = total_price + v[1]
    }
    return total_price
  end

  def free_items
    if @trolley[:grapes][0] % 4 == 0
      puts "\n*******************************************************"
      puts "|For buying #{@trolley[:grapes][0]} Grapes we offer you #{@trolley[:grapes][0] / 4} Banana for FREE!!!|"
      puts "*******************************************************"
    end
  end

  def show_ticket
      puts "In your trolley you have: "
      puts "------------------------ "
    @trolley.each { |fruit , quantity|
      print "#{quantity[0]} #{fruit} : #{quantity[1]+quantity[2]} €"
      if quantity[2] > 0
        print "   special offer: -#{quantity[2]}€\  sous-total: #{quantity[1]} € "
      else
        print "                       sous-total: #{quantity[1]} €"
      end
      puts
    }
   free_items

      puts "      Total = #{total_cost} €"
  end

end




price_table = {
                apple:      { spring: 10, summer: 10, autumn: 15, winter: 12 },
                orange:     { spring: 5, summer: 2, autumn: 5, winter: 5 },
                grapes:      { spring: 15, summer: 15, autumn: 15, winter: 15 },
                banana:     { spring: 20, summer: 20, autumn: 20, winter: 21 },
                watermelon: { spring: 50, summer: 50, autumn: 50, winter: 50, sunday: 100 }
              }


cart = ShoppingCart.new(price_table)

cart.add_item_to_cart("apple")
cart.add_item_to_cart("apple")
cart.add_item_to_cart("apple")
cart.add_item_to_cart("apple")
cart.add_item_to_cart("apple")
cart.add_item_to_cart("banana")
cart.add_item_to_cart("banana")
cart.add_item_to_cart("banana")
cart.add_item_to_cart("orange")
cart.add_item_to_cart("orange")
cart.add_item_to_cart("orange")
cart.add_item_to_cart("orange")
cart.add_item_to_cart("grapes")
cart.add_item_to_cart("grapes")
cart.add_item_to_cart("grapes")
cart.add_item_to_cart("grapes")
cart.add_item_to_cart("watermelon")


cart.cost
cart.show_ticket





# binding.pry
