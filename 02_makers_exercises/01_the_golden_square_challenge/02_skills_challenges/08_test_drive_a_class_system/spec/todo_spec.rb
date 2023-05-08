require "todo.rb"

describe Todo do
  it "initialize a new task" do
    task = Todo.new("walk the dog")
    expect(task.task).to eq "walk the dog"
  end
end