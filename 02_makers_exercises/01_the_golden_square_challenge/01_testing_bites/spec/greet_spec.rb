require 'greet'

describe "greet method" do
  it "return name in greeting" do
    greet = greet('Sarah')
    expect(greet).to eq 'Hello, Sarah!'
  end
end