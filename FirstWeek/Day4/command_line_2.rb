class TextApp
  
  def run
      if  check_credential != true
        exit
      end
      menu
      choice
  end

  def menu
        puts "Enter some text:"
        @text = gets.chomp
        print "What do you want to do?\n 1: Count Word (enter 1)\n 2: Count letter?(enter 2) \n 3: reverse the letter (3)\n 4: Convert to uppercase (enter 4)\n > "
        @user_choice = gets.chomp
  end

   def choice
    case @user_choice

    when "1"
      puts "Count Word"
      puts "Word count: #{@text.split.size}"
     
     when "2"
      puts "Count letter" 
      puts "Word count: #{@text.size}" 

    when "3"
      puts "Reverse the text"
      puts @text.reverse

    when "4"
      puts @text.upcase

    end
  end

  def get_username
    puts "Username:"
    gets.chomp
  end

  def get_password
    puts "Password:"
    gets.chomp
  end


  def check_credential
    username = get_username
    password = get_password
    if username == "alice" && password == "secret"
      @check = true
      return true
    else
      puts "Wrong Credentials."
      false
    end

  end

end



TextApp.new.run