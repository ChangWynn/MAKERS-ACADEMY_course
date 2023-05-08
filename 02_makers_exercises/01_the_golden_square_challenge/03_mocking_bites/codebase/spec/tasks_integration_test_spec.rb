require "task_list"
require "task"
require "taskFormatter"

RSpec.describe "integration tests" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  context TaskFormatter do
    it "instantiate a new object" do
      task1 = Task.new("Walk the dog")
      formatted_task = TaskFormatter.new(task1)
      expect(formatted_task).to be
    end

    it "should return string including empty bracket if task is not completed" do
      task1 = Task.new("Walk the dog")
      task_to_format = TaskFormatter.new(task1)
      expect(task_to_format.format).to eq "[ ] Walk the dog"
    end
    it "should return string including x in bracketsif task is completed" do
      task1 = Task.new("Walk the dog")
      task1.mark_complete
      task_to_format = TaskFormatter.new(task1)
      expect(task_to_format.format).to eq "[x] Walk the dog"
    end
  end
end