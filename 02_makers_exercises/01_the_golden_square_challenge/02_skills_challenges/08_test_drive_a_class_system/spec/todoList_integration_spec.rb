require "todo_list"
require "todo"

describe TodoList do
  context "#add method" do
    it "adds task in TodoList" do
      list = TodoList.new
      task = Todo.new("wash dishes")
      list.add(task)
      result = list.tasks[:incomplete]
      expect(result).to eq ["wash dishes"]
    end
    it "appends tasks in TodoList" do
      list = TodoList.new
      task = Todo.new("wash dishes")
      list.add(task)
      task = Todo.new("walk the dog")
      list.add(task)
      result = list.tasks[:incomplete]
      expect(result).to eq ["wash dishes", "walk the dog"]
    end
  end
end

describe Todo do
  context "#mark_done! method" do
    it "marks a task as complete" do
      list = TodoList.new
      task = Todo.new("walk the dog")
      list.add(task)
      task.mark_done!(list)
      result = list.tasks[:incomplete]
      expect(result).to eq []
      result2 = list.tasks[:complete]
      expect(result2).to eq ["walk the dog"]
    end
  end

  context "#done? method" do
    it "returns true if the task is done" do
      list = TodoList.new
      task = Todo.new("walk the dog")
      list.add(task)
      task.mark_done!(list)
      expect(task.done?(list)).to eq true
    end
    it "returns true if the task is done" do
      list = TodoList.new
      task1 = Todo.new("walk the dog")
      list.add(task1)
      task2 = Todo.new("wash dishes")
      list.add(task2)
      task1.mark_done!(list)
      expect(task1.done?(list)).to eq true
    end
    it "returns false if the task is not done" do
      list = TodoList.new
      task1 = Todo.new("walk the dog")
      list.add(task1)
      task2 = Todo.new("wash dishes")
      list.add(task2)
      task1.mark_done!(list)
      expect(task2.done?(list)).to eq false
    end
  end
end