require "03_checking_grammar"

describe "checking_grammar method" do
  context "fails when argument is wrong" do
    it "fails if argument is a integer" do
      expect{ checking_grammar(123) }.to raise_error "Argument is not a string object"
    end
    it "fails if argument is an array" do
      expect{ checking_grammar(["My name is chang."]) }.to raise_error "Argument is not a string object"
    end
  end

  it "returns true if grammar is correct" do
    result = checking_grammar("My name is chang.")
    expect(result).to eq "The grammar is correct"
  end
  it "returns false if grammar is incorrect" do
    result = checking_grammar("my name is chang.")
    expect(result).to eq "The grammar is incorrect"
  end
  it "returns false if grammar is incorrect" do
    result = checking_grammar("My name is chang")
    expect(result).to eq "The grammar is incorrect"
  end



end