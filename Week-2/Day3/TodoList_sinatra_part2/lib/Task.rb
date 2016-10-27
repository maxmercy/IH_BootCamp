require "date"

class Task
    attr_reader :content, :id, :status, :created_at, :updated_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @status = false
        @created_at = DateTime.now
        @updated_at = nil
    end


    def complete?
    	if @status == true
    		@status = true
    	end
    	@status
    end

    def complete!
    	@status = true
    end

    def make_incomplete!
    	@status = false
    end

    def creation_date
    	@created_at
    end

    def update_date
    	@updated_at = DateTime.now
    end


    def update_content!(newcontent)
    	@content = newcontent
    	update_date
    end    
end