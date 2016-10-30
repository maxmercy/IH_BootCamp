
class Engine
  def move_pistons
    "psshs"
  end
end

class BetterEngine
  def move_pistons
    "..."
  end
end

class Car
  def initialize(engine)
    @engine = engine
  end

  def start
    @engine.move_pistons
  end
end



regular_car = Car.new(Engine.new)
better_car = Car.new(BetterEngine.new)

require "pry"
binding.pry