require "task"

describe Task do 
  it "should create a new instance of task" do 
    task1 = Task.new("walk the dog")
    expect(task1).to eq task1
  end
end