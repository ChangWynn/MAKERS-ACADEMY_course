require "musicLibrary"
require "track"

describe MusicLibrary do
  context "#all method" do
    it "returns all tracks in a list" do
      library = MusicLibrary.new
      track1 = Track.new("Thriller", "Michael Jackson")
      track2 = Track.new("Russian Roulette", "Rihanna")
      library.add(track1)
      library.add(track2)
      expect(library.all).to eq [track1, track2]
    end
  end


  it "should return a list of tracks that match the keyword" do
    library = MusicLibrary.new
    track1 = Track.new("Thriller", "Michael Jackson")
    track2 = Track.new("Russian Roulette", "Rihanna")
    library.add(track1)
    library.add(track2)
    expect(library.search("rou")).to eq [track2]
  end
  it "should return a list of tracks that match the keyword" do
    library = MusicLibrary.new
    track1 = Track.new("Thriller", "Michael Jackson")
    track2 = Track.new("Russian Roulette", "Rihanna")
    track3 = Track.new("Hotel California", "Eagles")
    track4 = Track.new("Feeling Good", "Michael Buble")
    library.add(track1)
    library.add(track2)
    library.add(track3)
    library.add(track4)
    expect(library.search("MICHAEL")).to eq [track1, track4]
  end
end