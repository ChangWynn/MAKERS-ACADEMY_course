class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @chunk = []
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split.length
  end

  def reading_time(wpm) 
    self.count_words / wpm.floor
  end

  
  def reading_chunk(wpm, minutes) 
    total_word = wpm * minutes
    if @chunk.empty?
      @chunk = contents.split(" ")
      return @chunk.slice!(0, total_word).join(" ")
    else
      return @chunk.slice!(0, total_word).join(" ")
    end
  end
end
