class Diary
  attr_reader :entries
  def initialize
    @entries = []
  end

  def add(entry) 
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    total_word_count = 0
    @entries.each do |entry|
      total_word_count += entry.count_words
    end
    return total_word_count
  end

  def reading_time(wpm)
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    total_words = wpm * minutes
    contents_to_read = @entries.select do |entry|
      entry.count_words <= total_words
    end
    contents_to_read.sort_by!{ |entry| entry.count_words }
    return contents_to_read.last.contents
  end
end
