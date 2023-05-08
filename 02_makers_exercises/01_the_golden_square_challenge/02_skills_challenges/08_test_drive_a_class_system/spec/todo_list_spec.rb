require "todo_list"
require"todo"

describe TodoList do
  context "#incomplete method" do
    it "returns a list of incompleted tasks" do
      list = TodoList.new
      task1 = Todo.new("walk the dog")
      list.add(task1)
      task2 = Todo.new("wash dishes")
      list.add(task2)
      expect(list.incomplete).to eq ["walk the dog", "wash dishes"]
    end
  end

  context "#complete method" do
    it "returns a list of completed tasks" do
      list = TodoList.new
      task1 = Todo.new("walk the dog")
      list.add(task1)
      task2 = Todo.new("wash dishes")
      list.add(task2)
      task1.mark_done!(list)
      expect(list.complete).to eq ["walk the dog"]
    end
  end

  context "#give_up! method" do
    it "marks all incompleted tasks as complete" do
      list = TodoList.new
      task1 = Todo.new("walk the dog")
      list.add(task1)
      task2 = Todo.new("wash dishes")
      list.add(task2)
      list.give_up!
      result = list.tasks[:incomplete]
      expect(result).to eq []
      result2 = list.tasks[:complete]
      expect(result2).to eq ["walk the dog", "wash dishes"]
    end
  end
end 