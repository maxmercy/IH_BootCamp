#creating new tasks, deleting tasks, updating tasks, 
#completing tasks, and maybe even a few more surprises.
# require 'pry'
require "date"
require 'yaml/store'



class ToDoList
    # include Storage
    # include StorageAction
    attr_reader :tasks, :user
    def initialize(user)
        @tasks = []
        @user = user
        @storage_file = "./public/task.yml"
        @todo_store = YAML::Store.new( @storage_file)

    end

    def add_task(task)
        @tasks << task
    end

    def delete_task(id)
        @tasks.delete_if {|i| i == id }
    end

    def find_task_by_id(id)
        myIdarray = @tasks.select { |i| i.id == id }
        myIdarray[0]
    end

    def sort_by_created(updown)

        case updown.upcase

        when "ASC" 
            @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
        when "DESC"
            @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
        end

    end    


       def save
        @todo_store.transaction do 
            @todo_store[@user] = @tasks
        end 
    end


    def load_tasks
         
        if File.exist?( @storage_file)
            YAML.load_file( @storage_file) 
        else
            puts "file not exits" 
        end
        @save_info = YAML.load_file(@storage_file)
        # binding.pry
        @tasks = @save_info[@user]

    end



end





# todo_list = ToDoList.new("Josh")
# task = Task.new("Walk the dog")
# task2 = Task.new("Buy the milk")
# task3 = Task.new("Make my todo list into a web app")
# todo_list.add_task(task)
# todo_list.add_task(task2)
# todo_list.add_task(task3)



# todo_list.save


# todo_list = ToDoList.new("Josh")

# todo_list.load_tasks
# puts todo_list.tasks.length


# task4 = Task.new("Buy the milk")
# todo_list.save


