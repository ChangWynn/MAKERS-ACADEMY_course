require "counter"

RSpec.describe Counter do
  it "adds num to the count" do
    number = Counter.new
    number.add(5)
    result = number.report()
    expect(result).to eq "Counted to 5 so far"
  end
end