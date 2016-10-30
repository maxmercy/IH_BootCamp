# require "pry"

#### HASH in HASH
lemonade_finances = {
  tuesday:   { revenue: 15, cost: 4 },
  wednesday: { revenue: 5,  cost: 3 },
  thursday:  { revenue: 9,  cost: 3 },
  monday:    { revenue: 20, cost: 5 },
  friday:    { revenue: 17, cost: 4 },
}


#### HASH in ARRAY
arr = [
  { lat: 25, lng: 80, name: "Miami"    },
  { lat: 48, lng: 2,  name: "Paris"    },
  { lat: 40, lng: 3,  name: "Madrid"   },
  { lat: 18, lng: 66, name: "San Juan" },
] 

binding.pry

arr[0]

arr[1].key

arr[2].values

arr[0][:name].downcase

arr[3]].invert #invert key and value



###### mixing


hash = { 
			wat: [0, 1 , {
							wut: [0, [ [0,1,2,3,4,5,6,7,8, { 	
																:bqq => "toto" } ]]]   } ]}


p hash[:wat][2][:wut][1][0][9][:bqq]



arr = [[0,1,2,3,4,{ 
					:false => "toto" ,:secret => { 
													:lock => "tata" , 
													:unlock => [ "lose", "OPEN"]} } ] ]



p arr[0][5][:secret][:unlock][1]




# binding.pry