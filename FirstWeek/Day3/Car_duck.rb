class WheelCounter
  def initialize(vehicules)
    @vehicules = vehicules
  end


  def count 
    p @vehicules.map { |v| v.wheels }.reduce(:+)
  end

end


class Car
    def initialize
      @wheels = 4 
      @noise = "beep beep"
    end

    def wheels
       @wheels
    end
end

class Motocycle
  attr_reader :wheels, :noise
    def initialize
      @wheels = 2 
      @noise = "BEEP"
    end

end

class Bicycle
 
    def wheels
       2
    end

    def noise
        "Dring"
    end

end



vehicules = [Car.new, Motocycle.new, Bicycle.new]

WheelCounter.new(vehicules).count # 4 + 2 +2 = 8

class NoisePrinter
  def initialize(vehicules)
    @vehicules = vehicules
  end

  def print_noises
    puts @vehicules.map { &:noise }.join(", ")
  end
end


#NoisePrinter.new(vehicules).print_noises