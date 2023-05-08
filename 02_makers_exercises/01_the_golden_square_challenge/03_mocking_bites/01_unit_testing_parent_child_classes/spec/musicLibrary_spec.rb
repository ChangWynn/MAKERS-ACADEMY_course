require "musicLibrary"


describe MusicLibrary do
  it "should instanciate a new object" do
    library = MusicLibrary.new
    expect(library).to eq library
  end

  context "#add and #all method" do
    it "should add a track object into a library object" do
      library = MusicLibrary.new
      track1 = double(:Track)
      library.add(track1)
      expect(library.all).to eq [track1]
    end
  end

  context "#all method" do
    it "should add tracks in ibrary and returns all tracks" do
      library = MusicLibrary.new
      track1 = double(:Track)
      track2 = double(:Track)
      library.add(track1)
      library.add(track2)
      expect(library.all).to eq [track1, track2]
    end
  end

  context "#search method" do
    it "should return a list of tracks that match the keyword" do
      library = MusicLibrary.new
      track1 = double :Track, matches?: true
      library.add(track1)
      expect(library.search("thriller")).to eq [track1]
    end
    it "should return a list of tracks that match the keyword" do
      library = MusicLibrary.new
      track1 = double(:Track, matches?: true)
      track2 = double(:Track, matches?: false)
      track3 = double(:Track, matches?: true)
      track4 = double(:Track, matches?: false)
      library.add(track1)
      library.add(track2)
      library.add(track3)
      library.add(track4)
      expect(library.search("MICHAEL")).to eq [track1, track3]
    end
  end
end

# class FakeTrack
#   @title = "Thriller"
#   @artist = "Michael Jackson"
#   def matches?(keyword)
#     return true
#   end
# end