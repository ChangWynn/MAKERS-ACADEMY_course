RSpec.describe "doubles challenge" do
  it "creates a sophisticated double" do
    task = double :Task
    task_list = double :TaskList, add: nil,list: [task], count: 1, clear: :success
    
    # allow(task_list).to receive(:list) {[task]}
    # allow(task_list).to receive(:count) {1}
    # allow(task_list).to receive(:clear) {:success}

    # Don't edit below
    task_list.add(task)
    expect(task_list.list).to eq [task]
    expect(task_list.count).to eq 1
    expect(task_list.clear).to eq :success
  end
end







