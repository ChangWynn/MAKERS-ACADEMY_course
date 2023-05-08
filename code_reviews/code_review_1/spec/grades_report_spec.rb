require "grade_report"

describe "grade_report method" do
  it "should throw an error if given a wrong argument type" do
    expect{ grade_report(1) }.to raise_error ArgumentError
  end
  it "should throw an error if given a wrong argument type" do
    expect{ grade_report(["Green", "Amber"]) }.to raise_error ArgumentError
  end
  it "should return 'No results has been given' given an empty string" do
    expect(grade_report("")).to eq "No results has been given"
  end
  it "should return 'No results has been given' given an empty string" do
    expect(grade_report("")).to eq "No results has been given"
  end
  it "should return the grade's number of occurence" do
    expect(grade_report("Green")).to eq "Green: 1"
  end
end