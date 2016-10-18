class Employee
   attr_reader :name, :email 
   def initialize(name, email)
     @name = name
     @email = email
   end
   # def worker_tax
   #     tax = @salary * 0.82
   # end
end

class HourlyEmployee < Employee
    
   def initialize(name, email, hourly_rate, hours_worked)
       @name = name
       @email = email
       @hourly_rate = hourly_rate
       @hours_worked = hours_worked
   end

   def calculate_salary
     salary = @hourly_rate * @hours_worked 
     #returns the hours worked * hourly_rate
   end
end

class SalariedEmployee < Employee
   def initialize(name, email, year_salary)
       @name = name
       @email = email
       @year_salary = year_salary

   end

   def calculate_salary
        salary =  @year_salary / 52
     #returns the hours worked * hourly_rate
   end
end

class MultiPaymentEmployee < Employee 
   def initialize(name, email, year_salary, hourly_rate, hours_worked)
       @name = name
       @email = email
       @year_salary = year_salary
       @hourly_rate = hourly_rate
       @hours_worked = hours_worked
   end

   def calculate_salary
       salary = @year_salary / 52 + (@hours_worked - 40) * @hourly_rate
     #returns the hours worked * hourly_rate
   end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)

# puts josh.calculate_salary

nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)

# puts nizar.calculate_salary

ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

# puts ted.calculate_salary

maxime = HourlyEmployee.new('Maxime', 'Maxime@example.com', 15, 40)
marc = HourlyEmployee.new('Marc', 'Marc@example.com', 15, 41)

class Payroll
   def initialize(employees)
       @employees = employees
   end
    def notify_employee(employees)
         #email them
         puts "Which employee do you want to notify:"
          chosen_employee = gets.chomp
          employees.each do |worker|
                  if chosen_employee.downcase == worker.name.downcase

                      puts "to:" + worker.email
                      puts "Dear #{worker.name} you have been paid"
  
                  end
          end    
         # # choice = employee.select {|worker| worker.name.downcase == chosen_employee.downcase} 
         #  puts "to: #{chosen_employee}"
         #  puts chosen_employee.email


     end
     def pay_employees
       @employees.each do |worker|
       puts "#{worker.name}: #{worker.calculate_salary} with 18% Tax #{worker.calculate_salary * 0.18} Euros"
   
       end
     # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
     end
end

employees = [josh, nizar, ted, maxime, marc]
payroll = Payroll.new(employees)
payroll.pay_employees
payroll.notify_employee(employees)
