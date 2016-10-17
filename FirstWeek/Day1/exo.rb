habitants = {
	barcelona: 1_602_130,
	madrid: 3_165_000,
	miami: 417650,
}

#calculate the average population

=begin
populations = habitants.map { |city, pop| population}
total_population = populations.reduce(0) {|acc,pop| acc + pop}
puts total_populations / habitants.length
=end


AveragePopulation = habitants.reduce(0){|acc,(key,value)| acc + ( value / habitants.length )} 

puts AveragePopulation 


#print the population for each city, for aexemple, 
#Barcelone: 1602000jhabs

habitants.each { |key,value| puts "#{key.capitalize} has #{value} habitants"}
#each if need only pint information else map if returned array is importnat.