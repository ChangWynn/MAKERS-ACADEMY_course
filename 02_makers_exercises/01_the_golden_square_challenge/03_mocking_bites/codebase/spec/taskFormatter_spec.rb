require "taskFormatter"

describe TaskFormatter do
  it "instantiate a new object" do
    task = double :Task
    expect(TaskFormatter.new(task)).to be
  end
  it "instantiate a new object" do
    task = double :Task
    expect(TaskFormatter.new(task)).to be
  end

  context "#format method" do
    it "should return string including empty bracket if task is not completed" do
      task1 = double :Task, complete?: false
      allow(task1).to receive(:title) {"Walk the dog"}
      task_to_format = TaskFormatter.new(task1)
      expect(task_to_format.format).to eq "[ ] Walk the dog"
    end
    it "should return string including x in brackets if task is completed" do
      task1 = double :Task, complete?: true
      allow(task1).to receive(:title) {"Walk the dog"}
      task_to_format = TaskFormatter.new(task1)
      expect(task_to_format.format).to eq "[x] Walk the dog"
    end
  end
end