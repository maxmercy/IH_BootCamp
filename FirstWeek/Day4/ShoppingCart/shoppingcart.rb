require 'date'
require 'pry'

 #Trolley is a hash with :item as key => value [quantity,price,discount]

module Apple
  def apple_cost
    numb_apple = @trolley.values_at(:apple)[0][0]
    season_price = @price_table[:apple].values_at(season_check) 
    full_price =  (numb_apple) * season_price[0]
    discount_price = (numb_apple / 2) * season_price[0]
    price = (full_price - discount_price) 

    @trolley[:apple][1] = price 
    @trolley[:apple][2] = discount_price
  end
end

module Orange
  def orange_cost
    numb_orange = @trolley.values_at(:orange)[0][0]
    season_price = @price_table[:orange].values_at(season_check) 
    full_price = numb_orange * season_price[0]
    discount_price =  (numb_orange / 3 )* season_price[0]
    price = full_price - discount_price
   
    @trolley[:orange][1] = price 
    @trolley[:orange][2] = discount_price 
  end
end

module Banana
  def banana_cost 
    numb_banana = @trolley.values_at(:banana)[0][0]
    season_price = @price_table[:banana].values_at(season_check) 
    price = (numb_banana) * season_price[0]

    @trolley[:banana][1] = price 
  end
end

module Grapes
  def grapes_cost
    numb_grapes  = @trolley.values_at(:grapes)[0][0]
    season_price = @price_table[:grapes].values_at(season_check) 
    price = (numb_grapes) * season_price[0]

    @trolley[:grapes][1] = price 
  end
end


module Watermelon
  def watermelon_cost
    numb_watermelon  = @trolley.values_at(:watermelon)[0][0]
    watermelon_price = @price_table[:watermelon].values_at(season_check)   
    if Date.today.sunday? 
        watermelon_price = @price_table[:watermelon].values_at(:sunday) 
    else 
        watermelon_price = @price_table[:watermelon].values_at(season_check) 
    end
    price = (numb_watermelon) * watermelon_price[0]
    @trolley[:watermelon][1] = price 
  end
end


module Time_check
  #return season = season name
   def season_check
      year_day = Date.today.yday().to_i
      year = Date.today.year.to_i
      is_leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
      if is_leap_year and year_day > 60
        # if is leap year and date > 28 february 
        year_day = year_day - 1
      end
      if year_day >= 355 or year_day < 81
        season = :winter
      elsif year_day >= 81 and year_day < 173
        season = :spring
      elsif year_day >= 173 and year_day < 266
        season = :summer
      elsif year_day >= 266 and year_day < 355
       season = :autumn
      end
      return season
    end

    # #if sunday, sunday = true
    # def sunday_check
    #   if Date.today.sunday?
    #     sunday = true
    #   else
    #     sunday = false
    #   end
    # end
end


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