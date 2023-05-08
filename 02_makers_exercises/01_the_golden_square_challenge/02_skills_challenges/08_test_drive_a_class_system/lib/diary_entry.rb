class DiaryEntry
  attr_reader :title, :contents

  def initialize(title, contents)
    @title = title
    @contents = contents
    @index_start = 0
  end

  def count_words
    return @contents.split.length
  end

  def reading_time(wpm) 
    (count_words/wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    total_words = wpm * minutes
    @index_start = 0 if @index_start >= @contents.split.length
    chunk = @contents.split[@index_start...@index_start + total_words].join(" ")
    @index_start += total_words
    return chunk
  end
end








