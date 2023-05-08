require "check_codeword"

RSpec.describe "check_codeword method" do
  it "returns correct if the codeword is horse" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end
  it "returns close if the codeword if first and last letter is right" do
    result = check_codeword("house")
    expect(result).to eq "Close, but nope."
  end
  it "returns wrong if the codeword is incorrect" do
    result = check_codeword("cat")
    expect(result).to eq "WRONG!"
  end
end
