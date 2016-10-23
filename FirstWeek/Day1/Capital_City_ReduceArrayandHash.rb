cities_habitants = {
	barcelona: 1_602_130,
	madrid: 3_165_000,
	miami: 417650,
}

#calculate the average population
AveragePopulation = cities_habitants.reduce(0){|acc,(key,value)| acc + ( value / cities_habitants.length )} 
puts "\nThe average Population is #{AveragePopulation}\n\n" 


#print the population for each city, for aexemple, 
#Barcelone: 1602000jhabs


cities_habitants.each_pair { |key,value| puts "#{key.capitalize} has #{value} habitants"}
#each if need only pint information else map if returned array is importnat.
puts "\n"




######################################################################################


cities = ["miam","madrid","barcelona"]

citiesCap = cities.map do |name|
        name.capitalize

end

citiesCap

totlength = cities.reduce(0){|sum,i| sum + i.length}

puts (totlength.to_f / cities.length).round(2)

