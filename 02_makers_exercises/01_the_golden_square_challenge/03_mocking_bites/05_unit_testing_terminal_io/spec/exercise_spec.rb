require "exercise"

describe InteractiveCalculator do
  it "should returns 1" do
    io = double :kernel
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets) {"4"}
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets) {"3"}
    expect(io).to receive(:puts).with("Here is your result:")
    interactive_calculator = InteractiveCalculator.new(io)
    expect(interactive_calculator.run).to eq "4 - 3 = 1"
  end
end