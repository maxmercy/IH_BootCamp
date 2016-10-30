class Engine
  def initialize(noise)
    @noise = noise
  end

  def make_noise
    puts @noise
  end
end


class Car
  def initialize(noise, engine)
    @engine = engine
    @noise = noise
  end

  def make_noise
    @engine.make_noise
    puts @noise
  end
end

require "pry"




noisy_engine = Engine.new("pchhhh")
better_engine = Engine.new("...")


oldcar = Car.new("broom", noisy_engine)
bettercar = Car.new("broom", better_engine)


oldcar.make_noise
bettercar.make_noise


binding.pry
