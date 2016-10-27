require "sinatra"
require "sinatra/reloader"
require "./lib/sinatra_todo"
require "./lib/Task"
require "pry"

todo_list = ToDoList.new("Josh")

# task = Task.new("Walk the dog")
# task2 = Task.new("Buy the milk")
# task3 = Task.new("Make my todo list into a web app")
# todo_list.add_task(task)
# todo_list.add_task(task2)
# todo_list.add_task(task3)
# todo_list.save

# binding.pry
todo_list.load_tasks

get "/" do

	redirect '/tasks'
		erb :home
end


get "/tasks" do
	# binding.pry
	@tasks = todo_list.tasks


	erb :task_index
end

get "/new_task" do

	erb :new_task
end


# Route: '/tasks'(GET)
# ERB: task_index.erb
# What does it do?: Displays all of the tasks
