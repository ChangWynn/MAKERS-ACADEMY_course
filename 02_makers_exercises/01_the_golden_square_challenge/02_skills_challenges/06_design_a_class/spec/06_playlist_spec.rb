require "06_playlist"

describe Playlist do
    it "returns by default an empty array" do
      list1 = Playlist.new
      expect(list1.see_playlist).to eq []
    end

    it "ignores empty strings" do
      list1 = Playlist.new
      list1.add_track("")
      expect(list1.see_playlist).to eq []
    end

    it "add track into the playlist" do
      list1 = Playlist.new
      list1.add_track("thriller")
      expect(list1.see_playlist).to eq ["thriller"]
    end

    it "add and keep track of tracks added" do
      list1 = Playlist.new
      list1.add_track("thriller")
      list1.add_track("hotel california")
      expect(list1.see_playlist).to eq ["thriller", "hotel california"]
    end

    it "adds multiple tracks at once" do
      list1 = Playlist.new
      list1.add_track("thriller", "hotel california")
      expect(list1.see_playlist).to eq ["thriller", "hotel california"]
    end
end