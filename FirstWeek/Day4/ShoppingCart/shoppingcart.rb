require 'date'
require 'pry'


class ShoppingCart(price_table)
  def initialize
    @trolley = {}
    @price_table = price_table
  end


  def add_item_to_cart
  
  end



  def show

  end



  def cost

  end


end









price_table = {
                apple:      { spring: 10, summer: 10, autumn: 15, winter: 12 },
                orange:     { spring: 5, summer: 2, autumn: 5, winter: 5 },
                grape:      { spring: 15, summer: 15, autumn: 15, winter: 15 },
                banana:     { spring: 20, summer: 20, autumn: 20, winter: 21 },
                watermelon: { spring: 50, summer: 50, autumn: 50, winter: 50, sunday: 100 }


cart = ShoppingCart.new



cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.show
cart.cost