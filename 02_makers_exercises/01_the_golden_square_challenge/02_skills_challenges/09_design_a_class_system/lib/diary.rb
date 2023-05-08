class Diary
  attr_accessor :todo_list
  attr_reader :entries

  def initialize
    @entries = []
    @todo_list = {incomplete: [], complete: []}
  end

  def phone_numbers
    phone_numbers = []
    @entries.each do |entry|
      phone_numbers << entry.extract_phone_num
    end
    return phone_numbers.flatten
  end

  def find_best_entry(wpm,minutes)
    max_words = wpm * minutes
    return @entries.select do |entry| 
      entry.count_words <= max_words
    end.sort_by(&:count_words).last
  end
end