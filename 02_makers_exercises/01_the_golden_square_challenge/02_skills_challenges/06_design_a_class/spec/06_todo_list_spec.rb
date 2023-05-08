require "06_todo_list"

describe Todo_list do
  context "add_task method" do
    it "throws an error if wrong object is given" do
      list1 = Todo_list.new
      expect { list1.add_task(123) }.to raise_error ArgumentError
    end

    it "prints by default an empty array of tasks" do
      list1 = Todo_list.new
      expect(list1.print_tasks).to eq []
    end

    it "ignores empty strings" do
      list1 = Todo_list.new
      list1.add_task("")
      expect(list1.print_tasks).to eq []
    end

    it "adds and print single task" do
      list1 = Todo_list.new
      list1.add_task("walk the dog")
      expect(list1.print_tasks).to eq ["walk the dog"]
    end

    it "adds and print an array of tasks added separately" do
      list1 = Todo_list.new
      list1.add_task("walk the dog")
      list1.add_task("wash dishes")
      expect(list1.print_tasks).to eq ["walk the dog", "wash dishes"]
    end

    it "adds tasks added at once" do
      list1 = Todo_list.new
      list1.add_task("walk the dog", "wash dishes")
      expect(list1.print_tasks).to eq ["walk the dog", "wash dishes"]
    end

    it "throws an error if multiple tasks addition include invalid object" do
      list1 = Todo_list.new
      expect { list1.add_task("walk the dog", 123) }.to raise_error ArgumentError
    end
  end

  context "mark_complete method" do
    it "throws an error if task doesn't exist" do
      list1 = Todo_list.new
      expect { list1.mark_complete("walk the dog") }.to raise_error "Task doesn't exist"
    end
    it "remove task from list of tasks" do
      list1 = Todo_list.new
      list1.add_task("walk the dog")
      list1.mark_complete("walk the dog")
      expect(list1.print_tasks).to eq []
    end
    it "remove task from list of tasks" do
      list1 = Todo_list.new
      list1.add_task("walk the dog", "wash dishes", "shopping")
      list1.mark_complete("walk the dog")
      expect(list1.print_tasks).to eq ["wash dishes", "shopping"]
    end
  end
end