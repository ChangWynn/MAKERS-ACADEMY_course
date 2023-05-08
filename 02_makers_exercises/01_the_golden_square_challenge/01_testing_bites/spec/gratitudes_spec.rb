require "gratitudes"

RSpec.describe Gratitudes do
  it "pushes gratitude in the array" do
    new_gratitude = Gratitudes.new
    result = new_gratitude.add("family")
    expect(result).to eq ["family"]
  end

  it "creates a new string of gratitudes" do
    new_gratitude = Gratitudes.new
    new_gratitude.add("family")
    new_gratitude.add("friends")
    result = new_gratitude.format
    expect(result).to eq "Be grateful for: family, friends"
  end
end