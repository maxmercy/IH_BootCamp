# require "pry"


hash = { wat: [0, 1 , {wut: [0, [ [0,1,2,3,4,5,6,7,8, { :bqq => "toto" } ]]]   } ]}


p hash[:wat][2][:wut][1][0][9][:bqq]




arr = [[0,1,2,3,4,{ :false => "toto" ,:secret => { :lock => "tata" , :unlock => [ "lose", "OPEN"]} } ] ]




p arr[0][5][:secret][:unlock][1]




# binding.pry