require "track"

describe Track do
  it "should instanciate a new object" do
    track1 = Track.new("Thriller", "Michael Jackson")
    expect(track1).to eq track1
  end

  it "should return true if keyword matches title or artist name" do
    track1 = Track.new("thriller", "Michael Jackson")
    expect(track1.matches?("thriller")).to eq true
  end
  it "should return true if keyword matches title or artist name" do
    track1 = Track.new("thriller", "michael jackson")
    expect(track1.matches?("michael")).to eq true
  end
  it "should return false if keyword can not be found" do
    track1 = Track.new("thriller", "michael jackson")
    expect(track1.matches?("rihanna")).to eq false
  end
  it "should ignore casing" do
    track1 = Track.new("Thriller", "Michael Jackson")
    expect(track1.matches?("MICHAEL")).to eq true
  end
end