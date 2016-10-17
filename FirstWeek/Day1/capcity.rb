cities = ["miam","madrid","barcelona"]

citiesCap = cities.map do |name|
	name.capitalize

end

citiesCap

totlength = cities.reduce(0){|sum,i| sum + i.length}

puts totlength.to_f / cities.length


