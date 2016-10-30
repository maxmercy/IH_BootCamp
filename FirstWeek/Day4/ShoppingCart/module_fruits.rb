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
