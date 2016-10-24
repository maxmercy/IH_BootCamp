require "./sinatra_todo"


describe Task do 

	let(:mytask) { Task.new("Walk the dog")}

	 # before(:each)  { @mytask = Task.new }


	 describe "#id" do 
	 	it "asking id should return a ID"  do
	 		expect(mytask.id).to eq(1)
	 	end
	 end

	 describe "content" do 
	 	it "asking content should return string Walk the dog "  do
	 		expect(mytask.content).to eq("Walk the dog")
	 	end
	 end

	 describe "#id" do 
	 	it "asking id should return a ID"  do
	 		expect(mytask.id).to eq(3)
	 	end
	 end

	 describe "complete?" do 
	 	it "asking if task completed, by default false" do
	 		expect(mytask.complete?).to eq(false)
	 	end
	 end

	 describe "completed?" do 
	 	it "make task completed, get true" do
	 		mytask.complete!
	 		expect(mytask.complete?).to eq(true)
	 	end
	 end

	 describe "complete!" do 
	 	it "make task un_completed, get false" do
	 		mytask.complete!
	 		expect(mytask.make_incomplete!).to eq(false)
	 	end
	 end

	 describe "creation_date" do 
	 	it "test class of created at to be egual to a time" do
	 		expect(mytask.creation_date.class).to eq(DateTime)
	 	end
	 end	

	 describe "created_at" do
	 	it "check if creation date correpond to date creation (round ms)" do
	 		expect(mytask.created_at.iso8601).to eq(DateTime.now.iso8601)
	 	end
	 end		

	 describe "centent" do 
	 	it "update content from walk dog to buy milk" do
	 		mytask.update_content!("Buy milk")
	 		expect(mytask.content).to eq("Buy milk")
	 	end
	 end


	 describe "update_date" do 
	 	it "Update Content also Update date" do
	 		mytask.update_content!("Wed")
	 		expect(mytask.update_date).not_to eq(mytask.creation_date)
	 	end
	 end

# # task update_date!
# 	it "Update Content also Update date" do
# 		expect(mytask.update_content!("Wed")).to satisfy { @created_at != @update_at   }
# 	end

end



describe ToDoList do

	before :each do
		@task =  Task.new("Walk the dog") 
		@mylist = ToDoList.new("Max")
	end



	describe "add_task" do
		it "add a first task in the list, should not be empty" do
			expect(@mylist.add_task(@task)).not_to be_empty
		end
	end


	describe "#delete_task" do
		it "delete_task by it's id, id should disapear" do
			@mylist.delete_task(@task.id)
			expect(@mylist.tasks.include?(@task.id)).to eq(false)
		end
	end

	describe "find_task_by_id" do
		it "find_task_by_id return the content for id" do
			 # @newtask = Task.new("Walk the dog") 
			@mylist.add_task(@task)
			
			expect(@mylist.find_task_by_id(@task.id)).to equal(@task)
			expect(@mylist.find_task_by_id(@task.id)).not_to eq(nil)

		end
	end


	describe "find_task_by_id no exist id" do
		it "find_task_by_id return the content for id" do
			 # @newtask = Task.new("Walk the dog") 
			gosttaks = Task.new ""
			@mylist.add_task(gosttaks)
			expect(@mylist.find_task_by_id(gosttaks)).to eq(nil)
		end
	end

	describe "sort_by_created" do
		it "sort the task by creation date" do
			@task1 =  Task.new("Un")
			@task2 =  Task.new("Deux")
			@task3 =  Task.new("Trois") 
			@mylist.add_task(@task2)
			@mylist.add_task(@task3)
			@mylist.add_task(@task1)
			expect(@mylist.sort_by_created("ASC")).to eq([@task1,@task2,@task3])
			expect(@mylist.sort_by_created("desc")).to eq([@task3,@task2,@task1])

		end
	end



	describe "#Yalm stuff" do
		if "work should have save file"
			todo_list = TodoList.new("Josh")
			task = Task.new("Walk the dog")
			task2 = Task.new("Buy the milk")
			task3 = Task.new("Make my todo list into a web app")
			todo_list.save


		end
	end


end








