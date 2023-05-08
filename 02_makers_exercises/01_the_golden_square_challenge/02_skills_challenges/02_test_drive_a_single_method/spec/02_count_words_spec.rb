require "02_count_words"

describe "count_words method" do
  it "fails if given argument is not a string" do
    expect { count_words(["Hello"]) }.to raise_error "Argument is not a string object"
  end
  it "fails if given argument is not a string" do
    expect { count_words(5) }.to raise_error "Argument is not a string object"
  end

  it "returns 5" do
    result = count_words("Hello World")
    expect(result).to eq 2
  end
  it "returns 5" do
    result = count_words("My name is John!")
    expect(result).to eq 4
  end
  it "returns 5" do
    result = count_words("Hello, world! My name is John!")
    expect(result).to eq 6
  end
end