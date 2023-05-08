require "stringRepeater"

describe StringRepeater do
  it "should repeat 'TWIX' 10 times" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string")
    expect(io).to receive(:gets) {"TWIX"}
    expect(io).to receive(:puts).with("Please enter a number of repeats")
    expect(io).to receive(:gets) {"10"}
    expect(io).to receive(:puts).with("Here is your result:")
    string_repeater = StringRepeater.new(io)
    expect(string_repeater.run).to eq "TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX"
  end
end