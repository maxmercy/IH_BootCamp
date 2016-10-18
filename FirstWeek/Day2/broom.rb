class Car
  #attr_reader(:visited_city)

  #this is a class method because of the "self". Only on the class ie Car.other_noise
  def self.other_noise
  	puts "Class noise"
  end

  #control speed 
  def self.speed_control
  	puts "what is your curent speed?"
  	current_speed = gets.chomp 
  	if current_speed.to_i > 100
  		puts "WARNING!! TOO FAST!!!!"
  	else
  		puts "ok, be safe and keep going."
  	end
  end

    def self.noisy_car
    new("BROOM") # as class method don't have to tell Car.new
  	end

  def initialize(name, color, capacity, price, noise)
    @name = name
    @city = color
    @capacity = capacity
    @price = price
    @noise = noise
    @visited_city = []
   end

  
  #this is a instance method, can be apply on the instance (object of a class ie here guillaume_car )
	def make_noise
		puts @noise
	end

=begin
	def visit(city)
		@visited_city << city
	end

	def cities
		puts "city visited: #{@visited_city}" 

	end
=end
 #Marcshal is a library to write ruby object in text format then can read it
 
  def visit(city)
    marshaled_cities = Marshal.dump(cities + [city])
    IO.write("cities", marshaled_cities)
  end

  def cities  # return an array of visited cities
    if File.exist?("cities")
      marshaled_cities = IO.read("cities")
      Marshal.load(marshaled_cities)
    else
      []
    end
  end
end



class RacingCar < Car #inheritance

#we can overwrite the initialize or just transforme a methodes.

	def make_noise
		puts "VROUUUUUUUUUuUuUuuuuUUUuUuumMMMM"
	end
end





guillaume_car = Car.new("Twingo","Green",4,7000, "broum")
batman_car = Car.new("Batmobil","black",2,1000000000, "TADADADADADA TADADADADADA BATMAAAAN!")

f1 = RacingCar.new("Formule1","Red",1,1000000,nil)

guillaume_car.make_noise
batman_car.make_noise

f1.make_noise

=begin
Car.other_noise

Car.speed_control


guillaume_car.visit("Barcelona")
guillaume_car.visit("Madrid")
p guillaume_car.cities
guillaume_car.visit("Paris")
p guillaume_car.cities

=end

