require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it "returns a list containing all tasks" do
    list = TaskList.new
    task1 = double(:Task)
    task2 = double(:Task)
    list.add(task1)
    list.add(task2)
    expect(list.all).to eq [task1, task2]
  end

  it "returns false if all tasks are marked as complete" do
    list = TaskList.new
    task1 = double(:Task, complete?: true)
    task2 = double(:Task, complete?: false)
    list.add(task1)
    list.add(task2)
    expect(list.all_complete?).to eq false
  end
  it "returns false if all tasks are marked as complete" do
    list = TaskList.new
    task1 = double(:Task, complete?: true)
    task2 = double(:Task, complete?: true)
    list.add(task1)
    list.add(task2)
    expect(list.all_complete?).to eq true
  end
end