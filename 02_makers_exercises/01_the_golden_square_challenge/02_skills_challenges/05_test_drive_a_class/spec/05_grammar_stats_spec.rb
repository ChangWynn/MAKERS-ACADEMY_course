require "05_grammar_stats"

describe GrammarStats do
  # context "initialize method" do
  #   it "throws an error if no argument is given" do
  #     expect{ GrammarStats.new }.to raise_error ArgumentError
  #   end

  #   it "throws an error if wrong number of argument is given" do
  #     expect{ GrammarStats.new("hello", "world") }.to raise_error ArgumentError
  #   end
  # end

  context "check method" do
    it "returns false if given an empty string" do
      sentence = GrammarStats.new
      result = sentence.check("")
      expect(result).to eq false
    end
    it "returns false if given a one character long string" do
      sentence = GrammarStats.new
      result = sentence.check("H")
      expect(result).to eq false
    end
    it "returns false if doesn't start with a capital letter" do
      sentence = GrammarStats.new
      result = sentence.check("hello world.")
      expect(result).to eq false
    end
    it "returns false if doesn't end with a sentence-ending punctuation mark" do
      sentence = GrammarStats.new
      result = sentence.check("Hello world")
      expect(result).to eq false
    end
    it "returns true if ends with a dot" do
      sentence = GrammarStats.new
      result = sentence.check("Hello world.")
      expect(result).to eq true
    end
    it "returns true if ends with an exclamation mark" do
      sentence = GrammarStats.new
      result = sentence.check("Hello world!")
      expect(result).to eq true
    end
    it "returns true if ends with a question mark" do
      sentence = GrammarStats.new
      result = sentence.check("Hello world?")
      expect(result).to eq true
    end
  end

  context "percentage_good method" do
    
  end
end