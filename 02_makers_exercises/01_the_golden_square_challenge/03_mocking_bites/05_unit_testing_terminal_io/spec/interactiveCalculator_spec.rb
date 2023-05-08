require "interactiveCalculator"

describe InteractiveCalculator do
  it "should return the result of a subtraction" do
  io = double :io
  expect(io).to receive(:puts).with("Hello, I will subtract two numbers.")
  expect(io).to receive(:puts).with("Please enter a number")
  expect(io).to receive(:gets) {"10"}
  expect(io).to receive(:puts).with("Please enter another number")
  expect(io).to receive(:gets) {"5"}
  expect(io).to receive(:puts).with("Here is your result: ")
  calculus = InteractiveCalculator.new(io)
  calculus.run
  # expect(calculus.run).to eq "10 - 5 = 5"
  end
end