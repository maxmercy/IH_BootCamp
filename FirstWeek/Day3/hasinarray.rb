require "pry"

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
