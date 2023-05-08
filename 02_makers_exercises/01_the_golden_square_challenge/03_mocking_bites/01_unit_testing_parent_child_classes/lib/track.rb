class Track
  def initialize(title, artist) 
    @title = title
    @artist = artist
  end

  def matches?(keyword)
    title, artist = @title.downcase, @artist.downcase
    keyword.downcase!
    title.include?(keyword) || artist.include?(keyword) ? true : false
  end
end