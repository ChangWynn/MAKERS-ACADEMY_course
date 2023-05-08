class Playlist
  def initialize
    @tracks = []
  end

  def see_playlist
    return @tracks
  end

  def add_track(*track)
    track.each do |track|
      next if track == ""
      @tracks << track
    end
  end
end