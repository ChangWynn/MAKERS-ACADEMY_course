require "02_make_snippet"

describe "make_snippet method" do
  context "given string of 5 words or less" do
    it "returns the words" do
      var = "cheese ham bread sausage"
      result = make_snippet(var)
      expect(result).to eq "cheese ham bread sausage" 
    end
  end

  context "given string of 6 words" do
    it "returns 5 words and '...'" do
      var = "cheese ham bread sausage chicken cucumber"
      result = make_snippet(var)
      expect(result).to eq "cheese ham bread sausage chicken..."
    end
  end
end