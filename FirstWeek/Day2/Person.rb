class Person
	attr_reader :name
	attr_accessor :age

	def initialize(name, age)
    	@name = name
    	@age = age
   end

# this is the same than attr_reader
   # def name
   # 	@name
   # end

end


john = Person.new("john",35)
p john