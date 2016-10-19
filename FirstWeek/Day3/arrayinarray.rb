require "pry"

arr = [
  [ "a",      "b",         "c"             ],
  [  1,        2,           3              ],
  [ "pizza",  "asparagus", "chicken wings" ],
  [ "coffee", "tea",       "cola"          ]
]

binding.pry

arr.map {|sub_array| sub_array.size }

arr[3][2] #=> cola