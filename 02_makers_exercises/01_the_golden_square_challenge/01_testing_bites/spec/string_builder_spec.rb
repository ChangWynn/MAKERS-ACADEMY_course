require "string_builder"

RSpec.describe StringBuilder do
  it "returns the length of the string" do
    newString = StringBuilder.new
    newString.add("this is a string")
    result = newString.size
    expect(result).to eq 16
  end
  it "returns the string" do
    newString = StringBuilder.new
    newString.add("hello")
    expect(newString.output).to eq "hello"
  end
end
